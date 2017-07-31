//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.

func resetNav(){
    self.navigationController!.navigationBar.barTintColor           = AppColor.Dark_Black
    self.navigationItem.leftBarButtonItems = [IBbtnBarBack]
    self.navigationItem.rightBarButtonItems = [IBbtnBarAddProduct, IBbtnBarFilter]
    self.navigationItem.titleView = self.setNavigationBarTitle(title: "Products", subtitle: "\(intProductCount!) Items")
}

//*****************************************************

func setNavigationBarTitle(title:String, subtitle:String) -> UIView {
    
    let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
    //        let titleLabel = UILabel(frame: cgRectMake(0, -2, 0, 0))
    
    titleLabel.backgroundColor = UIColor.clear
    titleLabel.textColor = UIColor.white
    titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
    titleLabel.text = title
    titleLabel.sizeToFit()
    
    let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
    subtitleLabel.backgroundColor = UIColor.clear
    subtitleLabel.textColor = UIColor.groupTableViewBackground
    subtitleLabel.font = UIFont.systemFont(ofSize: 12)
    subtitleLabel.text = subtitle
    subtitleLabel.sizeToFit()
    
    let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
    titleView.backgroundColor = UIColor.clear
    titleView.addSubview(titleLabel)
    titleView.addSubview(subtitleLabel)
    
    let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
    
    //        if widthDiff > 0 {
    //            var frame = titleLabel.frame
    //            frame.origin.x = widthDiff / 2
    //        } else {
    //            var frame = subtitleLabel.frame
    //            frame.origin.x = abs(widthDiff) / 2
    //            titleLabel.frame = frame.integral
    //        }
    
    if widthDiff < 0 {
        let newX = widthDiff / 2
        subtitleLabel.frame.origin.x = abs(newX)
    } else {
        let newX = widthDiff / 2
        titleLabel.frame.origin.x = newX
    }
    
    
    return titleView
}
