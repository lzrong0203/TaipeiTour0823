//
//  DetailedViewController.swift
//  TaipeiTour0823
//
//  Created by Steve Lai on 2022/8/23.
//

import UIKit
import MapKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var naviBar: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var introView: UITextView!
    var point: Points.Point?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let point = point {
            self.navigationController?.navigationBar.topItem?.title = self.point?.name
        
        
            let location = CLLocation(latitude: point.nlat, longitude: point.elong)
            
//            CLLocation(latitude: Double(point.nlat)!, longitude: Double(point.elong)!)
//
            self.centerMapOnLocation(location: location)
            let pin = MKPointAnnotation()
            pin.coordinate = location.coordinate
            pin.title = point.name
            self.mapView.addAnnotation(pin)
            
            introView.text = point.introduction
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
