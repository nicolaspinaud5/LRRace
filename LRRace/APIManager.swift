//
//  APIManager.swift
//  LRRace
//
//  Created by Nicolas on 23/03/2017.
//  Copyright © 2017 Nicolas. All rights reserved.
//

import Foundation
import Alamofire
import Firebase

open class APIManager {
    
    //Reference to database root
    var ref = FIRDatabase.database().reference()
    
    var driversBirthdates = Array<String>()
    
    var driversAges = Array<Int>()
    
    var viewController : UIViewController
    
    /**
     Creating APIManager instance with ViewController that will show averageAge
     @param UIViewController vc
    */
    init(vc: UIViewController) {
        self.viewController = vc
    }
    
    /**
     Execute a GET request on API to retrieve JSON
     onSuccess : save data to Firebase DB, calculate averageAge and show it on ViewController
     onFailure : show an error depending on HTTP Error Code
     
     @param callback -> Int callback called with averageAge
     */
    func getJSONFromAPI(callback: @escaping (Int) -> ()) {
        
        Alamofire.request(Constants.API.URL)
            .validate()
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    
                    let apiResponse = response.value as! NSDictionary
                    let raceTableJSON = (apiResponse["MRData"] as! NSDictionary)["RaceTable"] as! NSDictionary
                    
                    let raceTable = RaceTable(dictionary: raceTableJSON)
                    let raceTableRef = self.ref.child("RaceTable")
                    
                    raceTableRef.setValue(raceTableJSON)
                    
                    raceTable?.races?.first?.results?.forEach({ (result) in
                        self.driversBirthdates.append((result.driver?.dateOfBirth)!)
                    })
                    
                    self.birthdateToAge(dates: self.driversBirthdates)
                    
                    callback(self.getAverageAge())
                    
                case .failure(_):
                    if response.response?.statusCode == nil {
                        (self.viewController as! ViewController).showNetworkErrorAlert()
                    } else {
                        (self.viewController as! ViewController).showErrorAlert(ErrorCode: response.response?.statusCode)
                    }
                    
                }
            })
    }

    /**
     Compute average age
     
     @return Int
     */
    fileprivate func getAverageAge() -> Int {
        return self.driversAges.reduce(0, +) / self.driversAges.count
    }

    /**
     Convert dates (String) to ages (Int)
     
     @param Array<String> dates
     */
    fileprivate func birthdateToAge(dates: Array<String>) {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        dates.forEach({ (date) in
        
            let formatedDate = dateFormatter.date(from: date)
        
            let calendar = NSCalendar.current as NSCalendar
        
            let ageComponents = calendar.components(.year, from: formatedDate!, to: Date(), options: .matchFirst)
        
            self.driversAges.append(ageComponents.year!)
        
        })
    }
}
