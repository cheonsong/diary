//
//  MapViewModel.swift
//  Presantation
//
//  Created by inforex_imac on 2022/09/14.
//

import Foundation
import RxSwift
import RxCocoa
import Then
import SnapKit
import RxGesture
import Util
import Domain
import Service
import GoogleMapsUtils
import GoogleMaps

//struct MapUseCases {
//    var
//}

// 무엇을 했다
protocol MapViewModelInput {
//    func didSubMenu(selected: MapSubMenu)          // 상단 서브메뉴 토글
//    func showQuickBookmark()                           // 빠른 북마크 보기
//    func didFloating(selected: MapQuickMenu)   // 하단 플루팅 버튼
//    func didSelectBookmarkFlag()                       // 북마크 깃발
//    func didOpenBookmarkDetail()                       // 북마크 상세보기 선택
}

enum MapType {
    case google, naver
}

enum MapSubMenu {
    case map, list
}

enum MapQuickMenu {
    case search
    case addBookmark
    case toggle
}


public class MapViewModel: NSObject {
    let mapData: [TestBK] = [
                            TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기?", distance: "장성 40km"),
                             TestBK(date: "1997-03-18", contents: "이것은 일기이것은 일기이것은 \n일기이것은 일기이것은 \n일기이것은 일기이것은 \n일기이것은 일기이것은 \n일기이것은 일기이것은 일기이것은 일기이것은\n 일기이것은 일기이것은 일기\n?", distance: "장성 40km")]
    
    // for Repository
    var mapUseCase : PlaceUseCase!
    
    init(mapUseCase: PlaceUseCase) {
        self.mapUseCase      = mapUseCase
    }
    
    
    var disposeBag: DisposeBag = .init()
    
    // MARK: @ Output
    var openWindow = PublishSubject<Bool>()
    
    
    func viewDidLoad() {
    }
  
    
    // test func 인터페이스 호출
    public func showFullScreenWindow() {
        
        self.openWindow.onNext(true)
    }
    
}

extension MapViewModel: MapViewModelInput {
    
    func didSubMenu(selected: MapSubMenu) {
        
    }
    
    func showQuickBookmark() {
        
    }
    
    func didFloating(selected: MapQuickMenu) {
        
    }
    
    func didSelectBookmarkFlag() {
        
    }
    
    func didOpenBookmarkDetail() {
        
    }
}

