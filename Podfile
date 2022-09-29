# Uncomment the next line to define a global platform for your project

platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!


workspace 'Diary'
project 'Diary/App.xcodeproj'
project 'Diary/Domain.xcodeproj'
project 'Diary/Design.xcodeproj'
project 'Diary/Presantation.xcodeproj'
project 'Diary/Repository.xcodeproj'
project 'Diary/Service.xcodeproj'
project 'Diary/Util.xcodeproj'



def pods
  pod 'RealmSwift'
end

target 'App' do
  project 'Diary/App/App.xcodeproj'
#  pod 'GoogleMaps'
  pod 'NMapsMap'
  pods

end

target 'Domain' do
  project 'Diary/Domain/Domain.xcodeproj'

  pods
#  pod "GooglePlaces", '7.1.0'
end

target 'Design' do
  project 'Diary/Design/Design.xcodeproj'

  pods

end

target 'Presantation' do
  project 'Diary/Presantation/Presantation.xcodeproj'
#  pod 'GoogleMaps'
#  pod 'Google-Maps-iOS-Utils'
#  pod "GooglePlaces", '7.1.0'
  pod 'NMapsMap'
  pods

end

target 'Repository' do
  project 'Diary/Repository/Repository.xcodeproj'

  pods

end

target 'Service' do
  project 'Diary/Service/Service.xcodeproj'
  pods
  pod 'GoogleMaps'
  pod 'Google-Maps-iOS-Utils'
  pod "GooglePlaces", '7.1.0'
  pod 'NMapsMap'
end

target 'Util' do
  project 'Diary/Util/Util.xcodeproj'
  pods

end
