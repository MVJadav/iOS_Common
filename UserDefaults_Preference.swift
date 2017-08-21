
//Make Keys
struct UserDefaultsKey {
    static let UserId                           = "UserId"
    static let FirstName                        = "FirstName"
    static let LastName                         = "LastName"
    static let Email                            = "Email"
    static let Mobile                           = "Mobile"
}


class Preference {
    
    static let defaults = UserDefaults.standard
    
    static func PutInteger(key : String , value : Int){
        defaults.set(value, forKey: key)
    }
    
    static func GetInteger(key : String) -> Int {
        if(isKeyNull(key: key) == true)
        {
            return 0
        }
        else
        {
            return defaults.integer(forKey: key)
        }
        
    }
    
    static func PutString(key : String , value : String? = ""){
        defaults.set(value, forKey: key)
    }
    static func PutObject(key : String , value : String? = ""){
        defaults.set(value, forKey: key)
    }
    
    static func GetString(key : String) -> String? {
        if(isKeyNull(key: key) == true)
        {
            return ""
        }
        else
        {
            return defaults.string(forKey: key)!
        }
    }
    
    static func PutImage(key : String , value : String){
        defaults.set(value, forKey: key)}
    
    static func GetImage(key : String) -> String? {
        if(isKeyNull(key: key) == true)
        {
            return ""
        }
        else
        {
            return defaults.string(forKey: key)!
        }
    }
    
    static func PutBool(key : String , value : Bool) {
        defaults.set(value, forKey: key)
    }
    
    static func GetBool(key : String ) -> Bool {
        if(isKeyNull(key: key) == true)
        {
            return false
        }
        else
        {
            return defaults.bool(forKey: key)
        }
    }
    
    static func isKeyNull (key: String) -> Bool
    {
        if(defaults.object(forKey: key) != nil)
        {
            return false
        }
        return true
    }
    
    static func prefrenceClearAll(){
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
    static func prefrenceClear() {
        Preference.PutInteger (key: UserDefaultsKey.UserId, value: 0)

    }
}

//Set value
if let strUserID = serviceResponse.Data?.UserID {
    Preference.PutInteger(key: UserDefaultsKey.UserId, value: strUserID)
}
if let name = serviceResponse.Data?.City {
    Preference.PutString(key: UserDefaultsKey.Name, value: name)
}

//Get Value
let id = Preference.GetInteger(key : UserDefaultsKey.UserId)
let name = Preference.GetString(key : UserDefaultsKey.Name)

// Checking Value
if Preference.GetInteger(key: UserDefaultsKey.UserId) == 0 || Preference.GetInteger(key: UserDefaultsKey.Steps) == 0 {
    
    let objLoginVC = LoginVC(nibName: "LoginVC", bundle: nil)
    let navigationController = UINavigationController(rootViewController: objLoginVC)
    appDelegate.window?.rootViewController = navigationController
    appDelegate.window?.makeKeyAndVisible()
}


