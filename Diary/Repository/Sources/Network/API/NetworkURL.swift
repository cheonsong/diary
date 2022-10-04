//
//  NetworkURL.swift
//  RepositoryTests
//
//  Created by cheonsong on 2022/09/13.
//

import Foundation

struct NetworkURL {
    static let naverUrl = "https://openapi.naver.com" // 파파고 번역 URL
    static let openWeatherMapUrl = "http://api.openweathermap.org"   // openweathermap.org 지오코딩, 날씨정보
    static let videoSubtitleUrl = "https://clovaspeech-gw.ncloud.com/external/v1/3837/42e83f26fe2e3dfb58aa93c61e8b1314bc175804d4da43d1814ac5b64efabf97" // 비디오 자막 url
}

struct AppKey {
    // Naver Client ID
    static let naverClientID = "3lbxmOH9ULv_yXxcd7Ix"
    static let naverClientSecret = "iEmQSS23O4"
    
    // OpenWeatherMap AppKey
    static let openWeatherMapAppKey = "7a30119259b375a62188ecebaf47d51b"
}
