//
//  EventCreate.swift
//  PlusOne
//
//  Created by Manjul Shrestha on 11/2/17.
//  Copyright © 2017 Manjul Shrestha. All rights reserved.
//

import UIKit

class EventCreate: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var createBtn: UIButton!
    @IBOutlet var cuisinePicker: UIPickerView!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var recipeUrlField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var eventDescField: UITextView!
    @IBOutlet var eventNameField: UITextField!
    
    let cuisineArray = ["American", "Mexican", "Chinese", "Indian", "Mediterrnean", "Italian", "Japnese"] as [String]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.cuisinePicker.delegate = self
        self.cuisinePicker.dataSource = self
        
    
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - PickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cuisineArray.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cuisineArray[row]
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
