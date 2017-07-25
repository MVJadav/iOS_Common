

import UIKit

class SwiftFunctions: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    
    
    override func viewDidLoad() {
        
        tblSize()
        
//        let swap = minMax(val1: 10, val2: 20)
//        print("After :: Val1 :",swap.val1, "Val2 : ",swap.val2)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -Multiple return and swap without temp variable
    
    func minMax( val1: Int, val2: Int) -> (val1: Int, val2: Int) {
        
        var val2 = val2
        var val1 = val1
        print("Befor:: Val1 :",val1, "Val2 : ",val2)
        
        val1 = val1+val2
        val2 = val1-val2
        val1 = val1-val2
        
        return(val1, val2)
    }
    

    func tblSize(){
        
        lblText.numberOfLines = 0;
        lblText.minimumScaleFactor = 0.5;
        lblText.adjustsFontSizeToFitWidth = true;
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
