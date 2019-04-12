//
//  BusAnnotation.swift
//  KKP
//
//  Created by TT8 on 29/03/2019.
//  Copyright © 2019 TT8. All rights reserved.
//

import UIKit
import MapKit

enum PlaceType {
    case bikeStop
    case busStop
    case defibrillator
}

class PlaceAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PlaceType
    init(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,title:String,subtitle:String,type:PlaceType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class PlaceAnnotations: NSObject {
    var places:[PlaceAnnotation]
    
    override init(){
        
        //BikeStop
        
        places = [PlaceAnnotation(52.404939,17.270196, title: "Iwno", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.403698,17.296927, title: "Wiktorowo", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.377459,17.343551, title: "Brzeźno", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.350759,17.331308, title: "Gułtowy", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.353375,17.214620, title: "Czerlejno", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.397514,17.221459 , title: "Kostrzyn, ul. Piasta", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.394122,17.226616 , title: "Kostrzyn ul. Warszawska", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.393424,17.236034, title: "Kostrzyn, ul. Powst. Wlkp", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.402924,17.224228, title: "Kostrzyn, ul. Okrężna", subtitle:"", type: .bikeStop)]
        places += [PlaceAnnotation(52.398023,17.242521, title: "Kostrzyn, ul. Krzywoustego", subtitle:"", type: .bikeStop)]
        
        // defibrillator
        
        places += [PlaceAnnotation(52.397283,17.226000, title: "DEFIBRYLATOR", subtitle:"", type: .defibrillator)]
        
        // Line 460
        
        places += [PlaceAnnotation(52.393650,17.227009, title: "Kostrzyn PKP 2", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.394481,17.235249, title: "SP 2", subtitle:"", type: .busStop)]
        places += [PlaceAnnotation(52.397986,17.236378, title: "Wrzesińska", subtitle:"", type: .busStop)]
        places += [PlaceAnnotation(52.398042,17.242296, title: "Osiedle Królewski", subtitle:"", type: .busStop)]
        places += [PlaceAnnotation(52.403635,17.270629, title: "Iwno", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.405146,17.270146, title: "Iwno Szkoła", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.404596,17.279997, title: "Rybakówka", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.403661,17.296991, title: "Wiktorowo", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.407712,17.318632, title: "Rujsca", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.424402,17.317007, title: "Sanniki", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.419150,17.285082, title: "Chorzałki", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.422605,17.264259, title: "Buszkówiec", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.419701,17.255874, title: "Glinka Szlachecka", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.412940,17.240729, title: "Glinka Duchowna", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.408312,17.232988, title: "Glinka Duchowna Baraki", subtitle:"", type: .busStop)]
        places += [PlaceAnnotation(52.403385,17.226747, title: "Słowackiego", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.402615,17.222155, title: "Cmentarna", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.401339,17.215029, title: "Okrężna", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.397850,17.206618, title: "Poznańska / DK-92", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.397562,17.214525, title: "Poznańska/Moniuszki", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.398059,17.224758, title: "SP 1", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.397947,17.234693, title: "Rondo Wadyńskiego", subtitle:"Linia 460", type: .busStop)]
        places += [PlaceAnnotation(52.398134,17.223507, title: "Biblioteka", subtitle:"Linia 460", type: .busStop)]
        
    }
}

