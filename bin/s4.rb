# require 'aws-sdk-s3'
require 'net/http'
require 'date'

uri = URI(ARGV[0])
duration_seconds = ARGV[1].to_i

# end_time = DateTime.strptime(end_time_unix,'%s')
end_time = Time.now.to_i + duration_seconds
# uri = URI("https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8")
# uri = URI("https://s2.content.video.llnw.net/smedia/42f4e71183054396907c0dea18241568/yd/yLpoUEilVrxhhYSkpsyGMnn9t0N3AYxWmoMsM7Faw/francstireurs_entrevue_ep472_seq24.mpegts/playlist-de5cb50573ac3952cd031f64973a614828771406.m3u8")
# uri = URI("https://s2.content.video.llnw.net/s2.content.video.llnw.net/playlist0.ts")

Thread.new {
  while true
    sleep 1
    exit if (Time.now.to_i >= end_time)
  end
}

Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Get.new uri

  http.request request do |response|
      response.read_body do |chunk|
        STDOUT.write chunk
      end
  end
end
