//
//  ViewController.swift
//  maz-UI-SegmentedControl
//
//  Created by Shaik abdul mazeed on 18/12/20.
//  Copyright © 2020 Shaik abdul mazeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Creating global variables
    var segmentStartingPoint:UISegmentedControl!
    var segmentDirection:UISegmentedControl!
    var segment:UISegmentedControl!
    var segment2 = UISegmentedControl()
    var segmentArray:[Int] = []
    var label:UILabel!
    var slider:UISlider!
    var stepper:UIStepper!
    var displayLabels:UILabel!
    var displayLabelsArray:[UILabel] = []
    var displayButtons:UIButton!
    var addButton:UIButton!
    var displayButtonsArray:[UIButton] = []
    var displaySwitches:UISwitch!
    var displaySwitchesArray:[UISwitch] = []
    var segmentCreatedValues:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.contents = #imageLiteral(resourceName: "images").cgImage
        displayUI()
        // Do any additional setup after loading the view.
    }
    //Creating a function to display
    func displayUI()
    {
        //1.Creating an instance to the segmentStartingPoint
        var segement1 = ["T2B","B2T"]
        segmentStartingPoint = UISegmentedControl(items: segement1)
        segmentStartingPoint.frame = CGRect(x: 210, y: 55, width: 100, height: 30)
        segmentStartingPoint.backgroundColor = UIColor.systemTeal
        view.addSubview(segmentStartingPoint)
        segmentStartingPoint.addTarget(self, action: #selector(displayAll), for: UIControl.Event.valueChanged)
        
        
        //2.Creating an instance to the segmentDirection
        var segement2 = ["L2R","R2L"]
        segmentDirection = UISegmentedControl(items: segement2)
        segmentDirection.frame = CGRect(x: 210, y: 113, width: 100, height: 30)
        segmentDirection.backgroundColor = UIColor.systemTeal
        view.addSubview(segmentDirection)
        segmentDirection.addTarget(self, action: #selector(displayAll), for: UIControl.Event.valueChanged)
        
        //3.Creating an instance to the segment
        var segement3 = ["Labels","Buttons", "Switches"]
        segment = UISegmentedControl(items: segement3)
        segment.frame = CGRect(x: 80, y: 170, width: 200, height: 40)
        segment.backgroundColor = UIColor.systemTeal
        view.addSubview(segment)
        segment.addTarget(self, action: #selector(displayAll), for: UIControl.Event.valueChanged)
        
        //4.Creating an instance to the slider
        slider = UISlider(frame: CGRect(x: 10, y: 230, width: 150, height: 20))
        view.addSubview(slider)
        slider.minimumValue = 0
        slider.value = 0
        slider.maximumValue = 100
        //Giving action to the slider to change values in label
        slider.addTarget(self, action: #selector(sliderChange), for: UIControl.Event.valueChanged)
        slider.addTarget(self, action: #selector(displayAll), for: UIControl.Event.valueChanged)
        //5.Creating an instance to the stepper
        stepper = UIStepper(frame: CGRect(x: 280, y: 220, width: 30, height: 30))
        view.addSubview(stepper)
        stepper.backgroundColor = UIColor.systemTeal
        stepper.minimumValue = 0
        stepper.value = 0
        stepper.maximumValue = 100
        //Giving action to the stepper to change values in labels
        stepper.addTarget(self, action: #selector(stepperChange), for: UIControl.Event.valueChanged)
        stepper.addTarget(self, action: #selector(sliderChange), for: UIControl.Event.valueChanged)
        stepper.addTarget(self, action: #selector(displayAll), for: UIControl.Event.valueChanged)
        //6.Creating an instance to the label
        label = UILabel(frame: CGRect(x: 200, y: 220, width: 50, height: 30))
        label.text = "\(slider.value)"
        label.textAlignment = .center
        view.addSubview(label)
        label.backgroundColor = UIColor.systemYellow
        //7.Creating an instance to the addButton
        addButton = UIButton(type: UIButton.ButtonType.system)
        addButton.frame = CGRect(x: 320, y: 260, width: 50, height: 30)
        view.addSubview(addButton)
        addButton.setTitle("ADD", for: UIControl.State.normal)
        addButton.setTitleColor(UIColor.systemBlue, for: UIControl.State.normal)
        addButton.backgroundColor = .systemFill
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addSegmentToButton), for: UIControl.Event.touchUpInside)
        
        segment2 = UISegmentedControl(items: [])
        segment2.frame = CGRect(x: 20, y: 260, width: 200, height: 30)
        view.addSubview(segment2)
        
        segment2.addTarget(self, action: #selector(segmentAction), for: UIControl.Event.valueChanged)
    }
    //Creating a function for getting the action to the new segment
    @objc func addSegmentToButton()
    {
        segment2.insertSegment(withTitle: label.text, at: segment2.numberOfSegments+1, animated: true)
        
//        removeView(type: displayLabelsArray)
//        removeView(type: displayButtonsArray)
//        removeView(type: displaySwitchesArray)
//        for i in 0..<segmentArray.count
//        {
//            segment2.insertSegment(withTitle: "\(Int(slider.value))", at: i, animated: true)
//        }
//        segment2.insertSegment(withTitle: "\(Int(slider.value))", at: [segmentArray], animated: true)
    }
    //Creating a fuction
    @objc func segmentAction()
    {
        segmentCreatedValues = Int(segment2.titleForSegment(at: segment2.selectedSegmentIndex)!)!
        label.text = "\(segmentCreatedValues)"
        slider.setValue(Float(segmentCreatedValues), animated: true)
        stepper.value = Double(segmentCreatedValues)
        displayAll()
    }
    
    //Creating a function for slider change value
    @objc func sliderChange()
    {
        stepper.value = Double(slider.value)
        label.text = "\(Int(slider.value))"
        segmentCreatedValues = Int(slider.value)
    }
    //Creating a function for stepper change value
    @objc func stepperChange()
    {
        label.text = "\(Int(slider.value))"
        slider.setValue(Float(stepper.value), animated: true)
        segmentCreatedValues = Int(stepper.value)
    }
    //Creating a function for to display labels,buttons and switches when selected
    @objc func displayAll()
    {
        //Condition to select segments for labels,Buttons and switches using their indexes
        if (segment.selectedSegmentIndex == 0 || segment.selectedSegmentIndex == 1 || segment.selectedSegmentIndex == 2)
        {
            if (segmentDirection.selectedSegmentIndex == 0 && segmentStartingPoint.selectedSegmentIndex == 0)
            {
                segmentLogic(xAx: 5, yAx: 350)
            }
            else if(segmentDirection.selectedSegmentIndex == 1 && segmentStartingPoint.selectedSegmentIndex == 0)
            {
                segmentLogic(xAx: 370, yAx: 350)
            }else if(segmentDirection.selectedSegmentIndex == 0 && segmentStartingPoint.selectedSegmentIndex == 1)
            {
                segmentLogic(xAx: 10, yAx: 810)
            }else if(segmentDirection.selectedSegmentIndex == 1 && segmentStartingPoint.selectedSegmentIndex == 1)
            {
                segmentLogic(xAx: 370, yAx: 810)
            }
        }
    }
       
    //Creating a function to remove the view
    func removeView(type: [Any])
    {
        for i in 0..<type.count
        {
            (type[i] as AnyObject).removeFromSuperview()
        }
    }
    //Creating a function for to create labels
    func segmentLogic(xAx:Int, yAx:Int)
    {
        //Creating variables
        var x = 0
        var y = yAx
        
        
        removeView(type: displayLabelsArray)
        removeView(type: displayButtonsArray)
        removeView(type: displaySwitchesArray)
        slider.value = Float(stepper.value)
        //For loop for creating the number of labels
        for index in stride(from: 1, through: slider.value, by: 1)
        {
            //conditon for segments selection
            if segment.selectedSegmentIndex == 0
            {
                //Creating an instance to the UILabel
                displayLabels = UILabel()
                if (segmentStartingPoint.selectedSegmentIndex == 0 && segmentDirection.selectedSegmentIndex == 0) || (segmentStartingPoint.selectedSegmentIndex == 1 && segmentDirection.selectedSegmentIndex == 0)
                {
                    displayLabels.frame = CGRect(x: xAx+40*x, y: y, width: 35, height: 25)
                    
                    
                }else if (segmentStartingPoint.selectedSegmentIndex == 0 && segmentDirection.selectedSegmentIndex == 1) || (segmentStartingPoint.selectedSegmentIndex == 1 && segmentDirection.selectedSegmentIndex == 1)
                {
                    displayLabels.frame = CGRect(x: xAx-40*x, y: y, width: 35, height: 25)
                }
                
                displayLabels.backgroundColor = UIColor.systemYellow
                displayLabels.text = "\(Int(index))"
                displayLabels.textAlignment = .center
                view.addSubview(displayLabels)
                
                //Appending the created labels into an array
                displayLabelsArray.append(displayLabels)
                
                //Incrementing the the x axis value
                x += 1
                //for loop to break the labels
                for j in stride(from: 10, through: slider.value, by: 10)
                {
                    if (Int(index) == Int(j))
                    {
                        x = 0
                        if segmentStartingPoint.selectedSegmentIndex == 0
                        {
                            //Increasing the y axis value
                            y += 40
                        }else if segmentStartingPoint.selectedSegmentIndex == 1
                        {
                            //Decreasing the y axis value
                            y -= 40
                        }
                        
                    }
                }
                
            }
            else if segment.selectedSegmentIndex == 1
            {
                //Creating an instance to the button
                displayButtons = UIButton(type: UIButton.ButtonType.system)
                if (segment.selectedSegmentIndex == 1 && segmentDirection.selectedSegmentIndex == 0)
                {
                    displayButtons.frame = CGRect(x: xAx+35*x, y: y, width: 30, height: 20)
                    
                }else if (segment.selectedSegmentIndex == 1 && segmentDirection.selectedSegmentIndex == 1)
                {
                    displayButtons.frame = CGRect(x: xAx-35*x, y: y, width: 30, height: 20)
                }
                displayButtons.setTitle("\(Int(index))", for: UIControl.State.normal)
                displayButtons.backgroundColor = UIColor.green
                displayButtons.layer.cornerRadius = 5
                view.addSubview(displayButtons)
                
                //Appending the created buttons into an array
                displayButtonsArray.append(displayButtons)
                
                //Incrementing the the x axis value
                x += 1
                
                //for loop to break the labels
                for j in stride(from: 11, through: slider.value, by: 11)
                {
                    if (Int(index) == Int(j))
                    {
                        x = 0
                        if segmentStartingPoint.selectedSegmentIndex == 0
                        {
                            //Increasing the y axis value
                            y += 50
                        }else if segmentStartingPoint.selectedSegmentIndex == 1
                        {
                            //Decreasing the y axis value
                            y -= 50
                        }
                        
                    }
                }
                
            }
            else if segment.selectedSegmentIndex == 2
            {
                //Creating an instance to the button
                displaySwitches = UISwitch()
                if (segment.selectedSegmentIndex == 2 && segmentDirection.selectedSegmentIndex == 0)
                {
                    displaySwitches.frame = CGRect(x: xAx+55*x, y: y, width: 49, height: 31)
                    
                }else if (segment.selectedSegmentIndex == 2 && segmentDirection.selectedSegmentIndex == 1)
                {
                    displaySwitches.frame = CGRect(x: xAx-55*x, y: y, width: 49, height: 31)
                }
                displaySwitches.backgroundColor = UIColor.systemFill
                displaySwitches.thumbTintColor = UIColor.systemRed
                view.addSubview(displaySwitches)
                
                //Appending the created buttons into an array
                displaySwitchesArray.append(displaySwitches)
                
                //Incrementing the the x axis value
                x += 1
                
                //for loop to break the labels
                for j in stride(from: 8, through: slider.value, by: 8)
                {
                    if (Int(index) == Int(j))
                    {
                        x = 0
                        if segmentStartingPoint.selectedSegmentIndex == 0
                        {
                            //Increasing the y axis value
                            y += 40
                        }else if segmentStartingPoint.selectedSegmentIndex == 1
                        {
                            //Decreasing the y axis value
                            y -= 40
                        }
                        
                    }
                }
                
            }
        }
    
        
    }
    //Creating a function for to remove superview
    func removeAll(type: Any)
    {
        (type as AnyObject).removeFromSuperview()
    }

}

