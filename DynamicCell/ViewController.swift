//
//  ViewController.swift
//  DynamicCell
//
//  Created by MindLogic Solutions on 23/05/16.
//  Copyright © 2016 com.mls. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var arrayOfContent:NSMutableArray=["Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.","Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.","Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.","Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContent.count
    }
    
    
    var y:CGFloat = 0
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.redColor()
        }
        else
        {
            cell.contentView.backgroundColor = UIColor.grayColor()
        }
        
        y = 5
        
        let lableFont = UIFont.systemFontOfSize(14)
        let lblName=cell.viewWithTag(1)as! UILabel
        let strName = arrayOfContent[indexPath.row] as! String
        let lableH = heightForProperty("\(strName)", font: lableFont)
        lblName.frame = CGRect(x:20, y:y, width: tblView.frame.size.width-40, height: lableH)
        lblName.text = strName
        lblName.font = lableFont
        lblName.numberOfLines=0
        lblName.sizeToFit()
        lblName.lineBreakMode = .ByWordWrapping
        let h = getStringHeight(strName, fontSize: 14, width: tblView.frame.size.width - 40)
        y = y + h + 5
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return y
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func heightForProperty(text:String, font:UIFont) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat.max, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.size.height
        
    }
    
    func getStringHeight(mytext: String, fontSize: CGFloat, width: CGFloat)->CGFloat {
        
        let font1 = UIFont.systemFontOfSize(14)
        let size = CGSizeMake(width,CGFloat.max)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .ByWordWrapping;
        let attributes = [NSFontAttributeName:font1,
                          NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let text = mytext as NSString
        let rect = text.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size.height
    }



}

