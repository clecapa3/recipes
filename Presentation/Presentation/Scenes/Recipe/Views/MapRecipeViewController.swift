//
//  MapRecipeViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 15/03/23.
//

import UIKit
import Data
import MapKit

class MapRecipeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mapa"
        guard let latitud = Double(recipe?.location.latitud ?? "0.00"),
              let longitud = Double(recipe?.location.longitud ?? "0.00") else { return }
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(
            latitude: latitud,
            longitude: longitud
        )
        annotation.coordinate = centerCoordinate
        annotation.title = recipe?.nombre
        mapView.addAnnotation(annotation)
    }

}
