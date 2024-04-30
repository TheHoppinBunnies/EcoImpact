//
//  API.swift
//  EcoImpact
//
//  Created by zongyang on 2024-04-06.
//

import Foundation

func PublicTransitCarbon(distance: Double, type: String = "ClassicBus", completion: @escaping (Double?, Error?) -> Void)  {
    let headers = [
        "X-RapidAPI-Key": "a38e5e8876msh0e9f6fc2c6587e0p1945dajsn6f37fdd24c61",
        "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
    ]
    
    let urlString = "https://carbonfootprint1.p.rapidapi.com/CarbonFootprintFromPublicTransit?distance=\(distance)&type=\(type)"
    
    guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        return
    }
    
    let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let error = error {
            completion(nil, error)
        } else {
            if let responseData = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        if let carbonEquivalent = json["carbonEquivalent"] as? Double {
                            completion(carbonEquivalent/100, nil)
                            completion(nil, NSError(domain: "Unable to parse carbonEquivalent from JSON", code: -1, userInfo: nil))
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    })
    
    dataTask.resume()
}



func FlightCarbon(distance: Double, type: String = "ShortEconomyClassFlight", completion: @escaping (Double?, Error?) -> Void)  {
    let headers = [
        "X-RapidAPI-Key": "a38e5e8876msh0e9f6fc2c6587e0p1945dajsn6f37fdd24c61",
        "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
    ]
    
    let urlString = "https://carbonfootprint1.p.rapidapi.com/CarbonFootprintFromFlight?distance=\(distance)&type=\(type)"
    
    guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        return
    }
    
    let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let error = error {
            completion(nil, error)
        } else {
            if let responseData = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        if let carbonEquivalent = json["carbonEquivalent"] as? Double {
                            completion(carbonEquivalent/525, nil)
                        } else {
                            completion(nil, NSError(domain: "Unable to parse carbonEquivalent from JSON", code: -1, userInfo: nil))
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    })
    
    dataTask.resume()
}


func CarTravelCarbon(distance: Double, type: String = "MediumPetrolCar", completion: @escaping (Double?, Error?) -> Void)   {
    let headers = [
        "X-RapidAPI-Key": "a38e5e8876msh0e9f6fc2c6587e0p1945dajsn6f37fdd24c61",
        "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
    ]
    
    let urlString = "https://carbonfootprint1.p.rapidapi.com/CarbonFootprintFromCarTravel?distance=\(distance)&vehicle=\(type)"
    
    guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        return
    }
    
    let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let error = error {
            completion(nil, error)
        } else {
            if let responseData = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        if let carbonEquivalent = json["carbonEquivalent"] as? Double {
                            completion(carbonEquivalent/2.5, nil)
                        } else {
                            completion(nil, NSError(domain: "Unable to parse carbonEquivalent from JSON", code: -1, userInfo: nil))
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    })
    
    dataTask.resume()
}



func HydroCarbon(consumption: Double, completion: @escaping (Double?, Error?) -> Void)  {
    let headers = [
        "X-RapidAPI-Key": "a38e5e8876msh0e9f6fc2c6587e0p1945dajsn6f37fdd24c61",
        "X-RapidAPI-Host": "carbonfootprint1.p.rapidapi.com"
    ]
    
    let urlString = "https://carbonfootprint1.p.rapidapi.com/TraditionalHydroToCarbonFootprint?consumption=\(consumption)&location=Canada"
    
    guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
        completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
        return
    }
    
    let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let error = error {
            completion(nil, error)
        } else {
            if let responseData = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        if let carbonEquivalent = json["carbonEquivalent"] as? Double {
                            completion(carbonEquivalent/3.5, nil)
                        } else {
                            completion(nil, NSError(domain: "Unable to parse carbonEquivalent from JSON", code: -1, userInfo: nil))
                        }
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    })
    
    dataTask.resume()
}
