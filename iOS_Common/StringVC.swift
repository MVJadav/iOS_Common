

import UIKit

class StringVC: UIViewController {

    @IBOutlet weak var popupView: UIView!
  
    var customView: UIView!
    
    @IBAction func openAlert(_ sender: AnyObject) {
        //ViewFunc()
        popupView.isHidden = false
    }
    @IBAction func closeAlert(_ sender: AnyObject) {
        popupView.isHidden = true
    }
    

    func ViewFunc()
    {
        customView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: self.view.frame.height - 200))
        
        //let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: self.view.frame.height - 200)
        
        view.addSubview(customView)
        customView.isHidden = false
        // then you create whatever you want to code
        // for example if I want to add OK button to your view
        
        let OkayButton = UIButton(frame: CGRect(x: 40, y: 100, width: 50, height: 50))
        customView.addSubview(OkayButton)
        
        //OkayButton.addTarget(self, action: "okButtonImplementation:", for: UIControlEvents.popupView)
        
        // from now any object you add that object to the customView subview :)
        
    }
    
    func okButtonImplementation(sender:UIButton)
    {
        // do whatever you want
        // make view disappears again
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        popupView.isHidden = true
        
        //concatString()
        //stringEquality()
        //checkExistString()
        //splitString()
        convertStringToNSData()
        enumTest(directionToHead: CompassPoint.north)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func concatString(){
        
        var fName:String = ""
        var lName:String = ""
        fName = "FisrName"
        lName = "LastName"
        fName.append(lName)
        
        print(fName)
        print("Counting Characters",fName.characters.count)
        
    }
    
    func stringEquality(){
        
        let firstString:String = "temp"
        let secondString:String = "temp"
        
        if(firstString == secondString){
            print("is Equal")
        }else{
            print("is Not Equal")
        }
        
    }
    
    
    func checkExistString(){
        
        let myString : String = "Swift is really easy!"
        
        if myString.range(of: "easy") != nil {
            
            print("Exists!")
            
        }else{
            print("Not Exists!")
        }
        
        print("Upper :", myString.uppercased())
        print("Lower :", myString.lowercased())
        
    }
    

    func splitString(){
        
        let myString : String = "Berlin, Paris, New York, San Francisco"
        print(myString)
        let myArray : [String] = myString.components(separatedBy: ",")
        print(myArray)
        //Returns an array with the following values:  ["Berlin", " Paris", " New York", " San Francisco"]
    }
    
    func convertStringToNSData(){
        
        let myString : String = "String to encode"
        let data = myString.data(using: .utf8)
        print(data)
        
    }
    
    func enumTest(directionToHead : CompassPoint){
        
        switch directionToHead {
            
            case .north:
                print("Lots of planets have a north")
            case .south:
                print("Watch out for penguins")
            case .east:
                print("Where the sun rises")
            case .west:
                print("Where the skies are blue")
        }
        
    }
    
    func swaps(){
        // MARK: - Swap Two Valuues without using a temporary variable
        var x = 5;
        var y = 10;
        // Code to swap 'x' and 'y'
        x = x + y;  // x now becomes 15
        y = x - y;  // y becomes 10
        x = x - y;  // x becomes 5
        print("After Swapping: X:", x, " & Y: ", y)
        /*
         10|5
         x15 = x+y
         y10 = x15-y5
         x5 = x15-y10
         */
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
