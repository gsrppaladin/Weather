//
//  DataViewController.swift
//  Weather
//
//  Created by Sam Greenhill on 6/25/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
// *******      **************       ****************************       ****************************

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
    
    var totalPages: Int = 0
    var pageIndex: Int = 0
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cityLbl.text = dataObject
        
        //set view colors:
        viewDay2.backgroundColor = UIColor(colorLiteralRed: 217/255, green: 169/255, blue: 206/255, alpha: 0.8)
        viewDay3.backgroundColor = UIColor(colorLiteralRed: 210/255, green: 156/255, blue: 199/255, alpha: 0.8)
        viewDay4.backgroundColor = UIColor(colorLiteralRed: 197/255, green: 134/255, blue: 186/255, alpha: 0.8)
        viewDay5.backgroundColor = UIColor(colorLiteralRed: 186/255, green: 117/255, blue: 177/255, alpha: 0.8)
        
        
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

        
        
        
        
        //Day 2
        let day2 = Date().addingTimeInterval(24 * 60 * 60)
        setWeatherObjects(temp: day2Temp, day: day2Day, img: day2Image, activityIndicator: activityIndicator2, dt: day2)
        
        //Day 3
        let day3 = day2.addingTimeInterval(24 * 60 * 60)
        setWeatherObjects(temp: day3Temp, day: day3Day, img: day3Image, activityIndicator: activityIndicator3, dt: day3)
        
        //Day 4
        let day4 = day3.addingTimeInterval(24 * 60 * 60)
        setWeatherObjects(temp: day4Temp, day: day4Day, img: day4Image, activityIndicator: activityIndicator4, dt: day4)
        
        //Day 5
        let day5 = day4.addingTimeInterval(24 * 60 * 60)
        setWeatherObjects(temp: day5Temp, day: day5Day, img: day5Image, activityIndicator: activityIndicator5, dt: day5)
        
        //setup page control
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = pageIndex
        
    }
    
    
    func setWeatherObjects(temp: UILabel, day: UILabel, img: UIImageView, activityIndicator: UIActivityIndicatorView, dt: Date) {
        
        temp.text = ""
        day.text = ""
        img.image = nil
        
        let formatterDisplay = DateFormatter()
        formatterDisplay.dateFormat = "EEEE"
        
        let dateDisplay = formatterDisplay.string(from: dt)
        
        let formatterParam = DateFormatter()
        formatterParam.dateFormat = "yyyy-MM-dd"
        
        let dateParam = formatterParam.string(from: dt)
        
        activityIndicator.startAnimating()
        
        getWeather(date: dateParam, city: dataObject) { (wObject) in
            
            if let weather = wObject as? weatherObj {
                
                activityIndicator.stopAnimating()
                
                if let temperature = weather.temperature {
                    temp.text = temperature + "°"
                }
                
                day.text = dateDisplay
                
                if let urlString = weather.iconUrl {
                    let url = URL(string: urlString)!
                    do {
                        let iconImageData: Data = try Data(contentsOf: url)
                        img.image = UIImage(data: iconImageData)
                    } catch {
                        print("Error fetching image data")
                    }
                }
                
            }
        }
    }
    
    
    

}



































