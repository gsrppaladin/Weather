//
//  weatherAPI.swift
//  Weather
//
//  Created by Sam Greenhill on 7/1/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import Foundation
struct weatherObj {
    var temperature: String?
    var humidity: String?
    var visibility: String?
    var windspeed: String?
    var weatherDecription: String?
    var iconUrl: String?
}

func getWeather(date: String?, city: String, callback: @escaping (weatherObj) -> ()) {

    
    //id here:
    let key = ""


    let urlStringBackUp = "http://api.worldweatheronline.com/premium/v1/weather.ashx?query="
    //let urlString1 = "http://api.worldweatheronline.com/free/v2/weather.ashx?q="
    let urlString2 = city
    let urlString3 = "&format=json&num_of_days=1&key="
    let urlString4 = key

    var urlString = ""
    
    if let dt = date {
        urlString = urlStringBackUp + urlString2 + urlString3 + urlString4 + "&date=\(dt)"
    } else {
        urlString = urlStringBackUp + urlString2 + urlString3 + urlString4
    }
    
    
    

    //print(urlString)
    let url = URL(string: urlString)

    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)

    let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in

        if error != nil {
            print(error)
        } else {
            var wObj = weatherObj()
            var jsonResult: Dictionary = [String: AnyObject]()

            do {
                jsonResult =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary

            } catch {
                print("Error loading weather info")
            }
//            print(jsonResult)

            if let mainObject = jsonResult["data"] {
                //print(mainObject)
                if let currentCondition = mainObject["current_condition"] as? NSArray {
                    //print(currentCondition)
                    //print("############# \(currentCondition.count) ##############")
                    //print(currentCondition[0])
                    if let temperature: [String] = currentCondition.value(forKey: "temp_C") as? [String] {
                        print(temperature[0])
                        wObj.temperature = temperature[0]
                    }

                    if let humidity: [String] = currentCondition.value(forKey: "humidity") as? [String] {
                     print(humidity[0])
                        wObj.humidity = humidity[0]
                    }
                    if let visibility: [String] = currentCondition.value(forKey: "visibility") as? [String] {
                        print(visibility[0])
                        wObj.visibility = visibility[0]
                    }

                    if let windspeed: [String] = currentCondition.value(forKey: "windspeedKmph") as? [String] {
                        print(windspeed[0])
                        wObj.windspeed = windspeed[0]
                    }

                    //weather description:
                    if let wd1 = currentCondition.value(forKey: "weatherDesc") as? NSArray {
                        if let wd2 = wd1.value(forKey: "value") as? NSArray {
                            if let wd3 = wd2[0] as? [String] {
                                print(wd3[0])
                                wObj.weatherDecription = wd3[0]
                            }
                        }
                    }
                        //weather ICON
                    if let iconObj = currentCondition.value(forKey: "weatherIconUrl") as? NSArray {
                        //print(iconObj)
                        if let icon = iconObj.value(forKey: "value") as? NSArray {
//                            print(icon[0])
                            if let icon1: [String] = icon[0] as? [String] {
                                print(icon1[0])
                                wObj.iconUrl = icon1[0]
                            }
                        }
                    }
                }
            }
            callback(wObj)
        }
    }
    task.resume()
}











//func getWeatherCoreFunction() {
//
//      //Id here:
//    let key = ""
//
//
//    let urlStringBackUp = "http://api.worldweatheronline.com/premium/v1/weather.ashx?query="
//    //let urlString1 = "http://api.worldweatheronline.com/free/v2/weather.ashx?q="
//    let urlString2 = "London"
//    let urlString3 = "&format=json&num_of_days=1&key="
//    let urlString4 = key
//
//    var urlString = ""
//    urlString = urlStringBackUp + urlString2 + urlString3 + urlString4
//
//    //print(urlString)
//    let url = URL(string: urlString)
//
//    let sessionConfig = URLSessionConfiguration.default
//    let session = URLSession(configuration: sessionConfig)
//
//    let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
//
//        if error != nil {
//            print(error)
//        } else {
//            var jsonResult: Dictionary = [String: AnyObject]()
//
//            do {
//                jsonResult =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary
//
//            } catch {
//                print("Error loading weather info")
//            }
////            print(jsonResult)
//
//            if let mainObject = jsonResult["data"] {
//                //print(mainObject)
//                if let currentCondition = mainObject["current_condition"] as? NSArray {
//                    //print(currentCondition)
//                    //print("############# \(currentCondition.count) ##############")
//                    //print(currentCondition[0])
//                    if let temperature: [String] = currentCondition.value(forKey: "temp_C") as? [String] {
//                        print(temperature[0])
//                    }
//
//                    if let humidity: [String] = currentCondition.value(forKey: "humidity") as? [String] {
//                     print(humidity[0])
//                    }
//                    if let visibility: [String] = currentCondition.value(forKey: "visibility") as? [String] {
//                        print(visibility[0])
//                    }
//
//                    if let windspeed: [String] = currentCondition.value(forKey: "windspeedKmph") as? [String] {
//                        print(windspeed[0])
//                    }
//
//                    //weather description:
//                    if let wd1 = currentCondition.value(forKey: "weatherDesc") as? NSArray {
//                        if let wd2 = wd1.value(forKey: "value") as? NSArray {
//                            if let wd3 = wd2[0] as? [String] {
//                                print(wd3[0])
//                            }
//                        }
//                    }
//
//                    if let iconObj = currentCondition.value(forKey: "weatherIconUrl") as? NSArray {
//                        //print(iconObj)
//                        if let icon = iconObj.value(forKey: "value") as? NSArray {
////                            print(icon[0])
//                            if let icon1: [String] = icon[0] as? [String] {
//                                print(icon1[0])
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    task.resume()
//}









