

import UIKit

class ArrayVC: UIViewController {

    override func viewDidLoad() {
        
        addDicInArray()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addDicInArray(){
        
        let swiftArray : NSMutableArray = []
        let dict = ["Current Zip Code" : 34050, "Previous Zip Code" : 43256, "Next Zip" : "the moon"] as [String : Any]
        swiftArray.add(dict)
        
        let dict1 = ["Current Zip Code1" : 34050, "Previous Zip Code1" : 43256, "Next Zip1" : "the moon"] as [String : Any]
        swiftArray.add(dict1)
        
        print("swiftArray :: ", swiftArray.count)
        print(swiftArray)
        
        let name: String? = (swiftArray[0] as AnyObject).value(forKey: "Current Zip Code") as? String
        print(name)
        //[[swiftArray objectAtI]]
        
    }
    func example(){
        var arrayMenuOptions = [Dictionary<String,String>]()
        arrayMenuOptions.append(["title":"Home", "icon":"HomeIcon"])
        arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        (arrayMenuOptions.count > 0) ? print("True") : print("False")
        
        for i in (0..<arrayMenuOptions.count){
            print("Title: ",arrayMenuOptions[i]["title"]!," | Icon: ",arrayMenuOptions[i]["icon"]!)
        }
    }
    
    func searchUsingPredicate(){
        
        var arrayMenuOptions = [Dictionary<String,String>]()
        var arrayMenuOptionsTemp = [Dictionary<String,String>]()
        arrayMenuOptions.append(["title":"Home", "icon":"HomeIcon"])
        arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        
        let searchText1:String = ""
        let searchText2:String = "home"
        let resultPredicate = NSPredicate(format: "title contains[c] %@ or icon contains[c] %@", searchText1,searchText2)
        arrayMenuOptionsTemp = (arrayMenuOptions as NSArray).filtered(using: resultPredicate) as! [Dictionary<String, String>]
        print(arrayMenuOptionsTemp)
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
