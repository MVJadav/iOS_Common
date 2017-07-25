

import UIKit

class JsonParssVC: UIViewController {

    override func viewDidLoad() {
        
        //getData()
        
        getWeatherInfo(fromCurrentURL: "http://www.flickr.com/services/feeds/photos_public.gne?tags=soccer&format=json")
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData(){
        
        let url = "http://www.flickr.com/services/feeds/photos_public.gne?tags=soccer&format=json"
        
        if let url = NSURL(string: url) {
            if let data = try? Data(contentsOf: url as URL) {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                    
                    //Store response in NSDictionary for easy access
                    let dict = parsedData as? NSDictionary
                    
                    
                    let currentConditions = "\(dict!["currently"]!)"
                    //This produces an error, Type 'Any' has no subscript members
                    
                    //let currentTemperatureF = ("\(dict!["currently"]["temperature"]!)").doubleValue
                    
                    
                    //Display all current conditions from API
                    print(currentConditions)
                    
                    //Output the current temperature in Fahrenheit
                   // print(currentTemperatureF)
                    
                }
                    //else throw an error detailing what went wrong
                catch let error as NSError {
                    print("Details of JSON parsing error:\n \(error)")
                }
            }
        }
        
    }
    
    func getWeatherInfo(fromCurrentURL URLString: String){
        
        // URLString = "https://www.badurl.url"
        //let url = "http://www.flickr.com/services/feeds/photos_public.gne?tags=soccer&format=json"
        
        guard let locationURL = NSURL(string: URLString) else {
            print("Unable to form location URL")
            return
        }
        // To ensure weather data is set correctly use an if let statement to validate that NSData is set before using it
        //if let weatherData = NSData(contentsOf: locationURL as URL) {
        do {
            // Here we are optimistically assuming that weather data is present and assigning it to the variable
            let weatherData = NSData(contentsOf: locationURL as URL)
            // Because weatherData is optimistically set above and we guarantee that is is present in the jsonObject
            // call using the as! Data statement then the try statement throws a fatal runtime error and it is
            // not caught in the do catch block.  Why is it not caught in the do catch block?
            let json = try JSONSerialization.jsonObject(with: weatherData as! Data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            if let currentDict = json as? NSDictionary {
                if (currentDict["currently"] as? NSDictionary) != nil {
                    // Data is parsed here
                    let currentArray = currentDict["currently"] as? NSDictionary
                    print(currentArray)
                    
                }else  {
                    print("Unable to deserialze")
                }
            }
        }catch let error as NSError {
            print("NSError CAUGHT ERROR \(error) -- Never executed")
        } catch {
            print("Catch Any Other Errors -- Never executed")
        }
        //}
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
