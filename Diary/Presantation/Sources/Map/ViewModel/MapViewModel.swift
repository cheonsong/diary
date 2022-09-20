//
//  MapViewModel.swift
//  Presantation
//
//  Created by inforex_imac on 2022/09/14.
//

import Foundation
import UIKit
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

enum MapSubMenu {
    case map, list
}

enum MapQuickMenu {
    case search
    case addBookmark
    case toggle
}


public class MapViewModel: NSObject {
    // for Repository
    var mapUseCase : MapUseCase!
    
    init(mapUseCase: MapUseCase) {
        self.mapUseCase      = mapUseCase
    }
    
    var layoutModel = MapLayoutModel()
    var disposeBag: DisposeBag = .init()
    
    // MARK: @ Output
    var openWindow = PublishSubject<Bool>()
    
    
    func viewDidLoad() {
        setLayout()
        setConstraint()
        setUI()
    }
    
    func setLayout() {
        
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._SUBMENU_MAP)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._SUBMENU_LIST)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._QUICK_BUTTON)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._BOOK_MARK_FLAG)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._BOOK_MARK_TOOL_TIP)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._FLOATING_SEARCH_BUTTON)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._FLOATING_ADD_BUTTON)
        layoutModel._BUTTON_CONTAINER.addSubview(layoutModel._FLOATING_EXTEND_BUTTON)
    }
    
    func setConstraint() {
        layoutModel._SUBMENU_MAP.snp.makeConstraints{
            $0.width.equalTo(50)
            $0.height.equalTo(25)
            $0.top.equalTo(50)
            $0.centerX.equalToSuperview().offset(-25)
        }
        
        layoutModel._SUBMENU_LIST.snp.makeConstraints{
            $0.width.equalTo(50)
            $0.height.equalTo(25)
            $0.top.equalTo(50)
            $0.centerX.equalToSuperview().offset(+25)
        }
        
        layoutModel._QUICK_BUTTON.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.right.equalToSuperview()
            $0.centerY.equalToSuperview().dividedBy(2)
        }
        
        layoutModel._BOOK_MARK_FLAG.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.center.equalToSuperview()
        }
        
        layoutModel._BOOK_MARK_TOOL_TIP.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.bottom.equalTo(layoutModel._BOOK_MARK_FLAG.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        layoutModel._FLOATING_SEARCH_BUTTON.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-100)
        }
        
        layoutModel._FLOATING_ADD_BUTTON.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(layoutModel._FLOATING_SEARCH_BUTTON.snp.top).offset(-20)
        }
        
        layoutModel._FLOATING_EXTEND_BUTTON.snp.makeConstraints{
            $0.width.height.equalTo(50)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(layoutModel._FLOATING_ADD_BUTTON.snp.top).offset(-20)
        }
        
    }
    
    func setUI(){
        
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
