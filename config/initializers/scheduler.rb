# scheduler.rb
if ENV["SCHEDULER"]=="true"
  Thread.new {
    while true
      sleep 1
      recordings = Recording.where.not(status: "done").where('record_at < ?', Time.zone.now)
      recordings.each do |recording|
        duration_seconds = eval(recording.duration).to_i
        Thread.new {
          command = "ruby bin/s4.rb #{recording.source_uri} #{duration_seconds} > #{recording.name}.mp3"
          puts "***********************"
          puts command
          puts "***********************"
          system(command)
        }
        recording.status = "done"
        recording.save
      end
    end
  }
end