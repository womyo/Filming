//
//  PlaceViewModel.swift
//  Filming
//
//  Created by 이인호 on 5/22/24.
//

import Firebase
import FirebaseFirestore
import NMapsMap

@Observable
class PlaceViewModel {
    private let dbCollection = Firestore.firestore().collection("places")
    private(set) var places: [Place]
    
    init(places: [Place] = []) {
        self.places = places
    }
    
    func addPlace(id: String, name: String, lat: Double, lng: Double) {
        let place = Place(id: id, name: name, lat: lat, lng: lng)
        
        _ = try? dbCollection.addDocument(from: place)
    }
    
    func fetchPlaces(sw: NMGLatLng, ne: NMGLatLng) async {
        do {
            let snapshot = try await dbCollection
                .whereField("lat", isGreaterThanOrEqualTo: sw.lat)
                .whereField("lat", isLessThanOrEqualTo: ne.lat)
                .whereField("lng", isGreaterThanOrEqualTo: sw.lng)
                .whereField("lng", isLessThanOrEqualTo: ne.lng)
                .getDocuments()
            
            let places: [Place] = snapshot.documents.compactMap { document in
                try? document.data(as: Place.self)
            }
            
            self.places = places
        } catch {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
}
