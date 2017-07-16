//
//  DataViewController.swift
//  Weather
//
//  Created by Sam Greenhill on 6/25/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    
    var dataObject: String = ""

    @IBOutlet var viewDay2: UIView!
    @IBOutlet var viewDay3: UIView!
    @IBOutlet var viewDay4: UIView!
    @IBOutlet var viewDay5: UIView!
    @IBOutlet var cityLbl: UILabel!
    
    @IBOutlet var day1Image: UIImageView!
    @IBOutlet var day1Date: UILabel!
    @IBOutlet var day1Temp: UILabel!
    @IBOutlet var day1Windspeed: UILabel!
    @IBOutlet var day1Visability: UILabel!
    @IBOutlet var day1Humidity: UILabel!
    @IBOutlet var activityIndicator1: UIActivityIndicatorView!
    
    @IBOutlet var day2Day: UILabel!
    @IBOutlet var day2Image: UIImageView!
    @IBOutlet var day2Temp: UILabel!
    @IBOutlet var activityIndicator2: UIActivityIndicatorView!
    
    @IBOutlet var day3Day: UILabel!
    @IBOutlet var day3Image: UIImageView!
    @IBOutlet var day3Temp: UILabel!
    @IBOutlet var activityIndicator3: UIActivityIndicatorView!
    
    @IBOutlet var day4Day: UILabel!
    @IBOutlet var day4Image: UIImageView!
    @IBOutlet var day4Temp: UILabel!
    @IBOutlet var activityIndicator4: UIActivityIndicatorView!
    
    @IBOutlet var day5Day: UILabel!
    @IBOutlet var day5Image: UIImageView!
    @IBOutlet var day5Temp: UILabel!
    @IBOutlet var activityIndicator5: UIActivityIndicatorView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cityLbl.text = dataObject
        
        
        //Day 1
        
        self.day1Temp.text = ""
        self.day1Windspeed.text = ""
        self.day1Visability.text = ""
        self.day1Humidity.text = ""
        self.day1Date.text = ""
        self.day1Image.image = nil
        //now we are starting fetching the information.
        activityIndicator1.startAnimating()
        getWeather(date: nil, city: dataObject) { (weatherObject) in
            if let weather = weatherObject as? weatherObj {
                self.activityIndicator1.stopAnimating()
                
                if let temp = weather.temperature {
                    self.day1Temp.text = temp + "° C"
                    
                }
                
                if let wspeed = weather.windspeed {
                    self.day1Windspeed.text = wspeed
                }
                
                if let visability = weather.visibility {
                    self.day1Visability.text = visability
                }
                
                if let hum = weather.humidity {
                    self.day1Humidity.text = hum
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "EEEE , dd-MMM-yyyy"
                let day1 = Date()
                let dateString = formatter.string(from: day1)
                
                self.day1Date.text = dateString
                
                if let urlString = weather.iconUrl {
                    let url: URL = URL(string: urlString)!
                    do {
                        let iconImageData: Data = try Data(contentsOf: url)
                        self.day1Image.image = UIImage(data: iconImageData)
                    } catch {
                        print("Error fetching image date")
                    }
                }
            }
        }
        
    }

    
    
    
    
    
    
    
    
    
    

}

