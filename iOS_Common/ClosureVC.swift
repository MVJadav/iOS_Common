

import UIKit

class ClosureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.funcClosure(strTring: "str") { (result, error) -> Void in
            //code
            
            print("Result: ",result)
            print("Error:", error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func funcClosure(strTring:String, CallBack:@escaping(_ result:String?, _ strError:String?)->Void!){
        
        return CallBack("result from Closure","error from Closure") //Service Call here
    }

}
