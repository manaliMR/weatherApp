//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by Manali Rami on 2018-09-16.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var cityName = " "

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(cityName)
        cityName = cityName.replacingOccurrences(of: " ", with: "%20")
        let url : URL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=Name%205e160fbfd243e76c231ddde2c3496ef1")!
        let urlRequest = NSMutableURLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            do{
                
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]
       
                if let description = json["weather"] as? [[String:AnyObject]] {
                    print(description[0]["description"]!)
                }
            } catch {
                print("There was an error with JSON")
            }
        }
            
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
