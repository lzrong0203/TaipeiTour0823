//
//  ViewController.swift
//  TaipeiTour0823
//
//  Created by Steve Lai on 2022/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    var pointsArray: [Points.Point] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        let urlString = "https://www.travel.taipei/open-api/zh-tw/Attractions/All?page=1"
        
        guard let url = URL(string: urlString) else{
            print("inValid URL!!!")
            return
        }
        
        var requesut = URLRequest(url: url)
        requesut.setValue("application/json", forHTTPHeaderField: "accept")
        requesut.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requesut) { data, response, error in
            
            if let error = error{
                fatalError(error.localizedDescription)
            }
            
            guard let data = data else {
                return
            }
            do{
                let points = try JSONDecoder().decode(Points.self, from: data)
                DispatchQueue.main.async {
                    for p in points.data{
                        self.pointsArray.append(p)
                    }
                    print("===")
                }
            }catch{
                
            }
            
            //            print(data)
        }.resume()
        
    }
    
    @IBAction func pointAdvise(_ sender: Any) {
        
        let alertController = UIAlertController(title: "This is a tour app", message: "Welcome!", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.toDetialVC()
        }))
        
        present(alertController, animated: true)
        
        //
    }
    
    func toDetialVC(){
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailedViewController
        
        if let point = pointsArray.randomElement(){
            detailVC.point = point
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

