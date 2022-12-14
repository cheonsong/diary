//
//  NaverMapServiceProvider.swift
//  Service
//
//  Created by ejsong on 2022/09/26.
//

import Foundation
import UIKit
import NMapsMap
import CoreLocation

public class NaverMapServiceProvider : NSObject , MapService {
    public func getPlaceName() -> String {
        return ""
    }
    
    public func getCameraLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    

    public typealias Map = NMFNaverMapView
    
    var service: LocationService?
    var moving : Bool = false
    
    public var naverMapView : NMFNaverMapView = {
        let mapView = NMFNaverMapView(frame: .zero)
        mapView.showLocationButton = false
        mapView.showZoomControls = true
        mapView.mapView.isZoomGestureEnabled = true
        mapView.mapView.isScrollGestureEnabled = true
        mapView.mapView.minZoomLevel = 7.0
        mapView.mapView.maxZoomLevel = 17
        return mapView
    }()
    
    lazy var marker : NMFMarker = {
      let marker = NMFMarker()
        marker.position = NMGLatLng()
        marker.iconImage = .init(image: UIImage(systemName: "mappin.and.ellipse")!)
        return marker
    }()
    
    public init(service: LocationService? = nil) {
        super.init()
        self.service = service
        setDelegate()
    }
    
    func setDelegate() {
        service?.setDelegate(delegate: self)
        naverMapView.mapView.addCameraDelegate(delegate: self)
    }
    
    public func search(place: String) {
        
    }
    
    public func getLocation() -> CLLocationCoordinate2D {
        return self.service?.getLocation() ?? CLLocationCoordinate2D.init(latitude: 0, longitude: 0)
    }

    public func setCurrentLocation() -> CLLocationCoordinate2D {
        let currentPosition =  self.service?.getLocation() ?? CLLocationCoordinate2D.init(latitude: 0, longitude: 0)
        self.setLocation(position: currentPosition)
        return currentPosition
    }
    
    public func setLocation(position: CLLocationCoordinate2D) {
        if moving {
            naverMapView.mapView.cancelTransitions()
        }else {
            let nmgLatLng = NMGLatLng(lat: position.latitude, lng: position.longitude)
            marker.position = nmgLatLng
            marker.mapView = naverMapView.mapView
            
            DispatchQueue.main.async {
                let update = NMFCameraUpdate(scrollTo: nmgLatLng)
                update.animation = .easeIn
                self.naverMapView.mapView.moveCamera(update)
            }
            moving = true
        }
        
    }
    
    public func setLocation(position: [CLLocationCoordinate2D]) {
       
    }
    
    public func getMapView() -> NMFNaverMapView {
        return naverMapView
    }
    
    public func setMarker(_ pos : NMGLatLng) {
        moving = false
        let nmgLatLng = pos
        marker.position = nmgLatLng
        marker.mapView = naverMapView.mapView
        print(#function , "Naver Lng: \(pos.lat) Lng: \(pos.lng)")
    }
}

extension NaverMapServiceProvider: LocationServiceDelegate {
    public func setLocation(location: CLLocationCoordinate2D) {
        //?????? ?????? ????????????
        setLocation(position: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
    }
}

extension NaverMapServiceProvider : NMFMapViewCameraDelegate {
    public func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        //0: ???????????? ????????? ????????? ????????????
        //-1: ???????????? ???????????? ?????? ?????????
        //-2: ?????? ???????????? ????????? ???????????? ???
        //-3: ????????? ????????? ???????????? ?????? ????????? ???????????? ???????????? ???????????????
        print(#function)
    }
    public func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
//        print(#function)
    }
    
    public func mapViewCameraIdle(_ mapView: NMFMapView) {
        print(#function)
//        //????????? ?????? ????????? ???
//        viewModel.reqNaverMapAddress(Location(lat: mapView.latitude, lon: mapView.longitude))
        setMarker(NMGLatLng(lat: mapView.latitude, lng: mapView.longitude))
    }

}
