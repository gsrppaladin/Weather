//
//  weatherAPI.swift
//  Weather
//
//  Created by Sam Greenhill on 7/1/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import Foundation


func getWeatherCoreFunction() {
    
    let key = "d54f9257c15d4eb29da10345172606"
    
    
    let urlStringBackUp = "http://api.worldweatheronline.com/premium/v1/weather.ashx?query="
    //let urlString1 = "http://api.worldweatheronline.com/free/v2/weather.ashx?q="
    let urlString2 = "London"
    let urlString3 = "&format=json&num_of_days=1&key="
    let urlString4 = key
    
    var urlString = ""
    urlString = urlStringBackUp + urlString2 + urlString3 + urlString4
    
    //print(urlString)
    let url = URL(string: urlString)
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)
    
    let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
        
        if error != nil {
            print(error)
        } else {
            var jsonResult: Dictionary = [String: AnyObject]()
            
            do {
                jsonResult =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary
                
            } catch {
                print("Error loading weather info")
            }
            print(jsonResult)
        }
        
    }
    
    task.resume()
}
