//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Anthony Youbi Sobodker on 2017-05-20.
//  Copyright © 2017 SBS. All rights reserved.
//

/**
 
 05/25/17 
 Program is 90% complete. I have to add some functionality in
 for dealing with multiple numbers and the operation button
 is pressed. Other than that it functions well as a basic
 four operation calculator. In the future it can be expanded
 by adding a clear button and some advanced operations.
 Will add in function for pressing multiple operations later. Tired. 
 
 
 05/26/17
 Redid most of the program's logic 
 Simplified the solution by using string inputs as opposed to integer/numerical
 The program now functions well. The only major improvement will be a clear button.
 
 Update 
 
 Added a clear button. Program is functionally complete.
 

 
 */



import UIKit
import AVFoundation

class ViewController: UIViewController {

    //calculator display
    @IBOutlet var display: UILabel!
    
    //creates audio player
    var btnSound: AVAudioPlayer!
    
    let screenSize = UIScreen.main.bounds
    
    var inputValue:Int?

    
    //Current Value on screen
    var currentVal: String?
    
    //used to store memory in the calculator loc 0 is used for 1st num in 2 number operations
    var memory: Int?
    
    //basic operation
    var operation:String?
    

    //operation flag for when op button is pressed
    //lets user store initialVal for use later
    var opFlag = false
    
    var initialVal: Int?
    
    var eFlag = false
    
    var lastOp: String?
    
    @IBAction func btn7Pressed(_ sender: Any)
    {
        inputValue = 7
        
        numtoScreen(inputValue!)
       
    }
    
    @IBAction func btn8Pressed(_ sender: Any)
    {
        inputValue = 8
         numtoScreen(inputValue!)

    }
    
    @IBAction func btn9Pressed(_ sender: Any)
    {
        inputValue = 9
       
         numtoScreen(inputValue!)
        
    }
    
    @IBAction func btn4Pressed(_ sender: Any)
    {
        inputValue = 4
        
         numtoScreen(inputValue!)
    }
    
    
    @IBAction func btn5Pressed(_ sender: UIButton)
    {
       inputValue = 5
       
         numtoScreen(inputValue!)

    }
 
    @IBAction func btn6Pressed(_ sender: Any)
    {
        inputValue = 6
       
         numtoScreen(inputValue!)

    }
    
    @IBAction func btn1Pressed(_ sender: Any)
    {
        inputValue = 1
        
        numtoScreen(inputValue!)
    }
    
    @IBAction func btn2Pressed(_ sender: Any)
    {
        inputValue = 2
        
        numtoScreen(inputValue!)

    }
    
    
    @IBAction func btn3Pressed(_ sender: Any)
    {
        inputValue = 3
        
        numtoScreen(inputValue!)

    }
    
    @IBAction func btn0Pressed(_ sender: Any)
    {
        inputValue = 0
        numtoScreen(inputValue!)
    }
    
    func numtoScreen(_ input:Int)
    {
        currentVal = currentVal! + String(input)
        
        initialVal = Int(currentVal!)
        
        display.text = currentVal!
     
    }
    
    @IBAction func clearScreen(_ sender: Any)
    {
        currentVal = ""
        initialVal = 0
        memory = 0
        
        display.text = String(0)
        
    }
    
    func add()
    {
        if (operation == "+")
      
        {
            var temp  = currentVal!
            
         
            
            if (temp == "")
            {              // num + 0 = num
                temp = "0" //Set this to 0 to return number after repeat op is pressed
            }
            
            //print ("Memory: " + String(describing: memory!))
            //print ("Current Value: " + currentVal!)
            
            if (currentVal == "")
            {
                currentVal = "0"
            }
            
            currentVal = String (memory! + Int(currentVal!)!)
            
            
            memory = Int(temp)
            
            display.text = currentVal!
            
        }
        
        operation = "+"
        memory = Int(currentVal!)
        currentVal = ""
        
        
        
        
    }
    
    func sub()
    {
        if (operation == "-")
        {
            var temp  = currentVal!
            
            if (temp == "")
            {              //e.g. num - 0 = num
                temp = "0" //Set this to 0 to return number after repeat op is pressed
            }
            
            //print ("Memory: " + String(describing: memory!))
            //print ("Current Value: " + currentVal!)
            
            if (currentVal == "")
            {
                currentVal = "0"
            }
            
            currentVal = String (memory! - Int(currentVal!)!)
            
            
            memory = Int(temp)
            
            display.text = currentVal!
            
        }
        
        operation = "-"
        memory = Int(currentVal!)
        currentVal = ""
       
    }
    
    func mult()
    {
        if (operation == "*")
        {
            var temp  = currentVal!
            
            if (temp == "")
            {              //e.g. Num * 1 = num
                temp = "1" //Set this to 1 to return number after repeat op is pressed
            }
            
            //print ("Memory: " + String(describing: memory!))
            //print ("Current Value: " + currentVal!)
            
            if (currentVal == "")
            {
                currentVal = "0"
            }
            
            currentVal = String (memory! * Int(currentVal!)!)
            
            
            memory = Int(temp)
            
            display.text = currentVal!
            
        }
        
        operation = "*"
        memory = Int(currentVal!)
        currentVal = ""
        
    }
    
    func div()
    {
        if (operation == "/")
        {
            var temp  = currentVal!
            
            if (temp == "")
            {              //e.g. num / 1 = num 
                temp = "1" //Set this to 1 to return number after repeat op is pressed
            }
            
            //print ("Memory: " + String(describing: memory!))
            //print ("Current Value: " + currentVal!)
            
            if (currentVal == "")
            {
                currentVal = "0"
            }
            
            currentVal = String (memory! / Int(currentVal!)!)
            
            
            memory = Int(temp)
            
            display.text = currentVal!
            
        }
        
        operation = "/"
        memory = Int(currentVal!)
        currentVal = ""
        
    }
    
    //basic function to set and prepare memory for operation
    func setMemory()
    {
        
    }
    
    //performs the 2 num op when equal button is pressed
    func performOp()
    {
        if (operation == "+" || (lastOp == "+" && operation == nil))
        {
            //print ("Memory inside equal func: " + String(describing: memory!))
            //print ("Current Value inside equal func: " + currentVal!)
            
            if (currentVal! == "")
            {
                currentVal = "0"
            }
            
          
         
            
            
            
            
            
            if (operation == nil)
            {
                currentVal = String (Int(currentVal!)! + initialVal!)
                print ("Initial Val inside equal func: " + String(describing: initialVal!))
                //memory = Int(currentVal!)
                
            }
            
            else
            {
                currentVal = String (memory! + Int(currentVal!)!)
            }
            
            
            
            lastOp = "+"
            operation = nil
        }

        if (operation == "-" || (lastOp == "-" && operation == nil))
        {
            print ("Memory inside equal func: " + String(describing: memory!))
            print ("Current Value inside equal func: " + currentVal!)
            
            if (currentVal! == "")
            {
                currentVal = "0"
            }
            
            
            
            if (operation == nil)
            {
                currentVal = String (Int(currentVal!)! - initialVal!)
                print ("Initial Val inside equal func: " + String(describing: initialVal!))
                //memory = Int(currentVal!)
                
            }
                
            else
            {
                currentVal = String (memory! - Int(currentVal!)!)
            }
            
            
            
            lastOp = "-"
            operation = nil
        }
        
        if (operation == "/" || (lastOp == "/" && operation == nil))
        {
            print ("Memory inside equal func: " + String(describing: memory!))
            print ("Current Value inside equal func: " + currentVal!)
            
            if (currentVal! == "")
            {
                currentVal = "0"
            }
            
            
            
            if (operation == nil)
            {
                currentVal = String (Int(currentVal!)! / initialVal!)
                print ("Initial Val inside equal func: " + String(describing: initialVal!))
                //memory = Int(currentVal!)
                
            }
                
            else
            {
                currentVal = String (memory! / Int(currentVal!)!)
            }
            
            
            
            lastOp = "/"
            operation = nil
        }


        if (operation == "*" || (lastOp == "*" && operation == nil))
        {
            print ("Memory inside equal func: " + String(describing: memory!))
            print ("Current Value inside equal func: " + currentVal!)
            
            if (currentVal! == "")
            {
                currentVal = "0"
            }
            
            
            
            if (operation == nil)
            {
                currentVal = String (Int(currentVal!)! * initialVal!)
                print ("Initial Val inside equal func: " + String(describing: initialVal!))
                //memory = Int(currentVal!)
                
            }
                
            else
            {
                currentVal = String (memory! * Int(currentVal!)!)
            }
            
            
            
            lastOp = "*"
            operation = nil
        }
        

        
        
        display.text = currentVal
   

    }
    
    
    //clears the screen
    func clear()
    {

        
    }
    
    @IBAction func divPressed(_ sender: Any)
    {
        div()
        
    }
    
    @IBAction func multPressed(_ sender: Any)
    {
        mult()
     
    }
    
    @IBAction func subPressed(_ sender: Any)
    {
        sub()
      
    }
    
    @IBAction func addPressed(_ sender: Any)
    {
        add()
    }
    
    @IBAction func equalPressed(_ sender: Any)
    {
        performOp()
    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        
        //turns it into a url
        let soundURL = URL(fileURLWithPath: path!)
        
        
        do
        {
            //passes audio link to btnSound player
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            
            //prepares soundfile for use
            btnSound.prepareToPlay()
            
        } catch let err as NSError
        {
           print (err.debugDescription)
        }
        
        
        memory = 0
        display.text = String(0)
        currentVal = ""
        
        
       
    }
    
    
    @IBAction func numberPressed (sender: UIButton)
    {
        playSound()
    }
    
    func playSound()
    {
        if (btnSound.isPlaying)
        {
           btnSound.stop()
        }
        
        else
        {
            btnSound.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

