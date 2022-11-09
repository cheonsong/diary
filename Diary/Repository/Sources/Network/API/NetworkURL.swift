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
    static let videoSubtitleUrl = "https://clovaspeech-gw.ncloud.com/external/v1/3872/ef6e8bbca61a3f7547d1154010a73dbd4bac10fb0194753cfc775e5d5aa2557c" // 비디오 자막 url
    static let naverGeoCodingUrl = "https://naveropenapi.apigw.ntruss.com" //네이버 지도 reverse Geocoding (위도/경도 > 지번 / 도로명 주소)
}

struct AppKey {
    // Naver Client ID
    static let naverClientID = "**"
    static let naverClientSecret = "**"
    // Naver Cloud Platform
    static let naverMapClientID = "**"
    static let naverMapSecret = "**"
    
    // OpenWeatherMap AppKey
    static let openWeatherMapAppKey = "**"
}
