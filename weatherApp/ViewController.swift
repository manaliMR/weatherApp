//
//  ViewController.swift
//  weatherApp
//
//  Created by Manali Rami on 2018-09-16.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let endeditingTapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_ :)))
        endeditingTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(endeditingTapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getWeather(_ sender: Any) {
        
        performSegue(withIdentifier: "weather", sender: self)
    }
    
    // connection between two view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc : WeatherViewController = segue.destination as! WeatherViewController
        vc.cityName = CityTextField.text!
    }
    
}

