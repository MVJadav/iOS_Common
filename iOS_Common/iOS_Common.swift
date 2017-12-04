
*********************************** FOR Button *************************************************************
    ——————————————————————
    button.setTitle("Button Title",for: .normal)
self.IBbtnSubmit.setTitle("ADD",for: .normal)
self.IBbtnSubmit.backgroundColor        = AppColor.AppTheme_Primary
self.IBbtnSubmit.setTitleColor(AppColor.AppTheme_Primary, for: .normal)

—————————————————

for i in (0..<(self.objCategoryModel?.Data?.Categories?.count)!){
    self.objCategoryModel?.Data?.Categories?[i].bgColor = Common().generateRandomColor()
}


*********************************** FOR UITable *************************************************************
self.IBtblPropertyList.separatorStyle            = UITableViewCellSeparatorStyle.None
self.IBtblPropertyList.registerNib(UINib(nibName: "MyPropertyListVCCell", bundle: nil), forCellReuseIdentifier: "MyPropertyListVCCell")
self.IBtblPropertyList.estimatedRowHeight        = 160.0
self.IBtblPropertyList.rowHeight                 = UITableViewAutomaticDimension
self.IBtblPropertyList.tableFooterView           = UIView()

Load default Cell
let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
cell.textLabel?.text        = "Title"
cell.detailTextLabel?.text   = "Description"
return cell!
—————————————
cell.accessoryType = .disclosureIndicator
cell?.selectionStyle = .none

************************************************************************************************
FILE : 1

let objFILE2 = FILE2(nibName: "FILE2", bundle: nil)
objFILE2.delegate                  = self
self.navigationController?.pushViewController(objFILE2, animated: true)

//MARK: Product Detail Delegate Method
extension objFILE1 : objFILE2Delegate {
    func didFinishTask() {
    }
}
——————————————————————————————————————————————————————
FILE : 2
@objc protocol objFILE2Delegate:class {
    @objc optional func didFinishTask()
}

var delegate: objFILE2Delegate?
self.delegate?. didFinishTask!()
    
    ************************************************************************************************
    
FILE : 1
NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: ContactsHomeVC.ContactsList), object: nil)

func showSpinningWheel(_ notification: NSNotification) {
}
FILE : 2
NotificationCenter.default.post(name: NSNotification.Name(rawValue: ContactsHomeVC.ContactsList), object: nil)
************************************************************************************************

—————————————————
pod --version
sudo gem install cocoapods
—————————————————
Importent Links
—————————————————
https://icons8.com/
https://www.iconfinder.com/
http://www.flaticon.com/
