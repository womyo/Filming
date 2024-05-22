//
//  Coordinator.swift
//  Filming
//
//  Created by 이인호 on 5/21/24.
//

import UIKit
import NMapsMap

class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
    static let shared = Coordinator()
    
    @Published var coord: (Double, Double) = (0.0, 0.0)
    @Published var userLocation: (Double, Double) = (0.0, 0.0)
    @Published var mapBounds: (sw: NMGLatLng, ne: NMGLatLng) = (NMGLatLng(lat: 0, lng: 0), NMGLatLng(lat: 0, lng: 0))
    private var markers: [NMFMarker] = []
    
    var locationManager: CLLocationManager?
    let startInfoWindow = NMFInfoWindow()
    var placeViewModel = PlaceViewModel()
    var places: [Place] = []
    
    let view = NMFNaverMapView(frame: .zero)
    
    override init() {
        super.init()
        
        view.mapView.positionMode = .direction
        view.mapView.isNightModeEnabled = true
        
        view.mapView.zoomLevel = 14
        view.mapView.minZoomLevel = 1
        view.mapView.maxZoomLevel = 17
        
        view.showLocationButton = true
        view.showZoomControls = false
        view.showCompass = false
        view.showScaleBar = false
        
        view.mapView.addCameraDelegate(delegate: self)
        view.mapView.touchDelegate = self
    }
    
    func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool) {}
    
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {}
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        let bounds = mapView.contentBounds
        mapBounds = (bounds.southWest, bounds.northEast)
        
        Task {
            await fetchPlacesWithinBounds()
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("위치 정보 접근이 제한되었습니다.")
        case .denied:
            print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
        case .authorizedAlways, .authorizedWhenInUse:
            coord = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            userLocation = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
            
            fetchUserLocation()
        @unknown default:
            break
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                DispatchQueue.main.async {
                    self.locationManager = CLLocationManager()
                    self.locationManager!.delegate = self
                    self.checkLocationAuthorization()
                }
            } else {
                print("Show an alert letting them know this is off and to go turn i on")
            }
        }
    }
    
    func fetchUserLocation() {
        if let locationManager = locationManager {
            let lat = locationManager.location?.coordinate.latitude
            let lng = locationManager.location?.coordinate.longitude
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0), zoomTo: 14)
            cameraUpdate.animation = .easeIn
            cameraUpdate.animationDuration = 0.2
            
            let locationOverlay = view.mapView.locationOverlay
            locationOverlay.location = NMGLatLng(lat: lat ?? 0.0, lng: lng ?? 0.0)
            locationOverlay.hidden = false
            
            locationOverlay.icon = NMFOverlayImage(name: "location_overlay_icon")
            locationOverlay.iconWidth = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.iconHeight = CGFloat(NMF_LOCATION_OVERLAY_SIZE_AUTO)
            locationOverlay.anchor = CGPoint(x: 0.5, y: 1)
            
            view.mapView.moveCamera(cameraUpdate)
        }
    }
    
    @MainActor
    func fetchPlacesWithinBounds() async {
        let sw = mapBounds.sw
        let ne = mapBounds.ne
        
        await placeViewModel.fetchPlaces(sw: sw, ne: ne)
        
        clearAllMarkers()
        addMarkers()
    }
    
    func getNaverMapView() -> NMFNaverMapView {
        return view
    }
    
    func addMarkers() {
        placeViewModel.places.forEach { place in
            let marker = NMFMarker()
            marker.iconImage = NMF_MARKER_IMAGE_DEFAULT
            marker.position = NMGLatLng(lat: place.lat, lng: place.lng)
            marker.isHideCollidedSymbols = true
            marker.mapView = view.mapView
            markers.append(marker)
        }
    }
    
    func clearAllMarkers() {
        markers.forEach { marker in
            marker.mapView = nil
        }
        markers.removeAll()
    }
}
