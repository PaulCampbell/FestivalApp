# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :festival do |festival|
  festival.name                  "Pheonix"
  festival.description           "some description"
  festival.startdate             2011-07-12
  festival.enddate				 2011-07-15
end

Factory.define :stage do |stage|
  stage.name					"The Other Stage"
  stage.description				"Stage description"
  stage.latitude				-1.4324542
  stage.longitude				56.23423
  stage.festival				:festival
  stage.picture					"http://www.google.com/img.src"
end

Factory.define :band do |band|
  band.name = "The Levellers"
  band.description => "Folk punk band formed in 1992.",
  band.weblink => "http://www.google.com"
end