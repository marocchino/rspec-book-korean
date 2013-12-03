먼저(/^영화가 있다면$/) do
  @movie = Movie.create!
end

만일(/^쇼타임을 "(.*?)"의 "(.*?)"으로 설정합니다$/) do |date, time|
  @movie.update_attribute(:showtime_date, Date.parse(date))
  @movie.update_attribute(:showtime_time, time)
end

그러면(/^쇼타임의 설명은 "(.*?)"이 됩니다$/) do |showtime|
  expect(@movie.showtime).to eq(showtime)
end
