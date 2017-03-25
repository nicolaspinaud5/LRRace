//
//  ViewController.swift
//  LRRace
//
//  Created by Nicolas on 21/03/2017.
//  Copyright © 2017 Nicolas. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!

    //Manager listening on network host reachability
    let manager = NetworkReachabilityManager(host: Constants.API.URL)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.86, green:0.95, blue:0.97, alpha:1.00)
        
        let apiManager = APIManager(vc: self)
        
        //When network host is reachable launch getJSONFromAPI and show average age
        //Else show a network error
        manager?.listener = { status in
            if String(describing: status) == "notReachable" {
                self.showNetworkErrorAlert()
            }
            
            if (self.manager?.isReachable)! {
                apiManager.getJSONFromAPI() { (averageAge) in
                    self.ageLabel.text = "La moyenne d'âge de la dernière course est de \(averageAge) ans."
                }
            }
        }
        
        manager?.startListening()
        
        apiManager.getJSONFromAPI() { (averageAge) in
            self.ageLabel.text = "La moyenne d'âge de la dernière course est de \(averageAge) ans."
        }
        
    }
    
    /**
     Show an alert with HTTP Error Code and a message
     
     @param Int? ErrorCode
     */
    func showErrorAlert(ErrorCode: Int?) {
        
        var errorMessage = ""
        
        guard let httpCode = ErrorCode else {
            return
        }
        
        switch(httpCode) {
        case 400:
            errorMessage = "URL is incorrect."
        case 404:
            errorMessage = "Ressource not found."
        default:
            errorMessage = "An error occured."
        }
        
        let alertController = UIAlertController(title: "Error \(httpCode)", message: "\(errorMessage)", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    /**
     Show an alert with network error message
     */
    func showNetworkErrorAlert() {
        
        let alertController = UIAlertController(title: "Network Error", message: "Network is unreachable", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
