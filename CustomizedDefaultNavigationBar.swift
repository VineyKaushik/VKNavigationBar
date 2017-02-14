//
//  CustomizedDefaultNavigationBar.swift
//  Door Burst
//
//  Created by Viney Kaushik on 01/01/17.
//  Copyright © 2017 Viney Kaushik. All rights reserved.
//

import UIKit

@objc protocol CustomizedDefaultNavigationBarDelegate {
    
    optional func barItemsAction(sender: UIButton)
}

class CustomizedDefaultNavigationBar: UINavigationBar {

//Private variables...
    var yellowLineView: UIView!
    var buttonTag = 10
    var navigationBarIten: UINavigationItem!
    var delegateNavigation : CustomizedDefaultNavigationBarDelegate?
    
    
//MARK: Initializers....
    init(frame: CGRect, buttonImage: [UIImage], buttonHighlightedImage: [UIImage], numberOfButtons : Int, barTitle: NSString, alignmentOfTitle: String, indexOFButtonToSetTitle: Int) {
        super.init(frame: frame)
        
    //Setting background color of Navigation Bar...
        self.titleTextAttributes = [NSForegroundColorAttributeName : COLOR_CODE.YELLOW_COLOR, NSFontAttributeName: UIFont(name: FONT.BOLD, size: aspectWidth(15))!]
        
    //Setting Navigation Bar...
        setNavigationBar(buttonImage, buttonHighlightedImage: buttonHighlightedImage, numberOfButtons: numberOfButtons, barTitle: barTitle, alignmentOfTitle: alignmentOfTitle, indexOFButtonToSetTitle: indexOFButtonToSetTitle)
        self.barTintColor = COLOR_CODE.NAVIGATIONBAR_COLOR
        
    //Adding Yellow line View to navigation bar...
        self.yellowLineView = UIView(frame: CGRect(x: 0, y: self.frame.origin.y + self.frame.height - 1, width: self.frame.width, height: 1))
        self.yellowLineView.backgroundColor = COLOR_CODE.YELLOW_COLOR
        
        self.addSubview(yellowLineView)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
//MARK:-creating buttons on the bar view
    func setNavigationBar(buttonImage: [UIImage]?, buttonHighlightedImage: [UIImage]?, numberOfButtons: Int?, barTitle: NSString?, alignmentOfTitle: String?, indexOFButtonToSetTitle: Int?) {
        
        let navigationItem = UINavigationItem(title: barTitle! as String)
        
     
        if barTitle != nil && numberOfButtons == 1 {
            
        //create a label for title
            self.setItems([navigationItem], animated: false)
            
        } else if barTitle != "" && numberOfButtons == 2 {      //Number of buttons are 2
            
            if indexOFButtonToSetTitle! - 1 == 1 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == 0 {
                        
                    //create button...
                        let barButtonItem = UIBarButtonItem(image: buttonImage![0], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                        barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                        barButtonItem.tag = buttonTag
                        navigationItem.leftBarButtonItem = barButtonItem
                        
                    //create button...
//                        let barButtons = UIButton(frame: CGRect(x: aspectWidth(10), y: 20, width: 35, height: self.frame.height - 20))
//                        barButtons.setImage(buttonImage![0], forState: UIControlState.Normal)
//                        barButtons.setImage(buttonHighlightedImage![0], forState: UIControlState.Highlighted)
////                        barButtons.contentHorizontalAlignment = .Left
//                        barButtons.tag = buttonTag
//                        barButtons.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//                        
//                    //Custom buttons with image created like this.
//                        let barButtonItem = UIBarButtonItem(customView: barButtons)
//                        buttonTag += 10
//                        navigationItem.leftBarButtonItem = barButtonItem
                        
                    } else if i == indexOFButtonToSetTitle! - 1 {
                        
                    //create a label for title...
                        //Title has already been created on top starting of this method...
                    }
                }
                
                self.setItems([navigationItem], animated: false)
                
            } else {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == 1 {
                        
                    //create right button...
                        let barButtonItem = UIBarButtonItem(image: buttonImage![0], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                        barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                        barButtonItem.tag = buttonTag
                        buttonTag += 10
                        navigationItem.rightBarButtonItem = barButtonItem
                        
                    } else if i == 0 {
                        
                    //create a label for title...
                        //Title has already been created on top starting of this method...
                    }
                }
                
                self.setItems([navigationItem], animated: false)
            }
        
        } else if barTitle != "" && numberOfButtons == 3 {      //Number of buttons are Three...
         
            if indexOFButtonToSetTitle! - 1 == 0 {
                
            //Navigation Right button Items array...
                var navigationItmes = [UIBarButtonItem]()
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == indexOFButtonToSetTitle! - 1 {          //title on the left && buttons on right
         
                        //label for title has already been created on top...of this method...
                        
                    } else {
                        
                    //create buttons on right side
                        if i == numberOfButtons! - 1 {
                            
                        //create button...
                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            barButtonItem.tag = buttonTag
                            navigationItmes.append(barButtonItem)
                            
                        } else {
                            
                        //create button...
                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            barButtonItem.tag = buttonTag
                            navigationItmes.append(barButtonItem)
                        }
                        
                        navigationItem.rightBarButtonItems = navigationItmes
                        buttonTag += 10
                    }
                }
                
            } else if indexOFButtonToSetTitle! - 1 == 1 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == 1 {          //title in center of the left && right button
                        
                    //label for title has already been created on top...of this method...
                        
                        
                    } else {
                        
                        if i == numberOfButtons! - 1 {      //create buttons on right side
                            
                        //create button...
                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tag = buttonTag
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            buttonTag += 10
                            navigationItem.rightBarButtonItem = barButtonItem
                            
                        } else if i == 0 {  //Back button Left side...
                            
                        //create button...
                            let barButtons = UIButton(frame: CGRect(x: aspectWidth(10), y: 20, width: 35, height: self.frame.height - 20))
                            barButtons.setImage(buttonImage![0], forState: UIControlState.Normal)
                            barButtons.setImage(buttonHighlightedImage![0], forState: UIControlState.Highlighted)
                            barButtons.contentHorizontalAlignment = .Left
                            barButtons.tag = buttonTag
                            barButtons.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            
                        //Custom buttons with image created like this.
                            let barButtonItem = UIBarButtonItem(customView: barButtons)
                            buttonTag += 10
                            navigationItem.leftBarButtonItem = barButtonItem
                        }
                    }
                }
            }
            
            self.setItems([navigationItem], animated: false)
            
        } else if barTitle != "" && numberOfButtons == 4 {      //Number of buttons are Three...
            
        //Navigation Right button Items array...
            var navigationItmes = [UIBarButtonItem]()
         
            if indexOFButtonToSetTitle! - 1 == 0 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == indexOFButtonToSetTitle! - 1 {          //title on the left && buttons on right
                        
                        //label for title has already been created on top...of this method...
                        
                    } else {
                        
                    //create buttons on right side
                        if i == numberOfButtons! - 1 {
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.setImage(buttonImage![i - 1], forState: UIControlState.Normal)
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
//                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
//                            barButtonItem.tag = buttonTag
//                            navigationItmes.append(barButtonItem)
                            
                        } else {
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.setImage(buttonImage![buttonImage!.count - 1], forState: UIControlState.Normal)
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
//                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
//                            barButtonItem.tag = buttonTag
//                            navigationItmes.append(barButtonItem)
                        }
                        
                        navigationItem.rightBarButtonItems = navigationItmes
                        buttonTag += 10
                    }
                }
                
            } else if indexOFButtonToSetTitle! - 1 == 1 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == 1 {          //title in center of the left && right button
                        
                        //label for title has already been created on top...of this method...
                        
                        
                    } else {
                        
                        if i == numberOfButtons! - 1 {      //create buttons on right side
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.contentHorizontalAlignment = .Right
                            button.setImage(buttonImage![buttonImage!.count - 1], forState: UIControlState.Normal)
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![buttonImage!.count - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
//                            barButtonItem.tag = buttonTag
//                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
//                            buttonTag += 10
//                            navigationItmes.append(barButtonItem)
                            
                        } else if i == 0 {  //Back button Left side...
                            
                        //create button...
                            let barButtons = UIButton(frame: CGRect(x: aspectWidth(10), y: 20, width: 35, height: self.frame.height - 20))
                            barButtons.setImage(buttonImage![0], forState: UIControlState.Normal)
                            barButtons.setImage(buttonHighlightedImage![0], forState: UIControlState.Highlighted)
                            barButtons.contentHorizontalAlignment = .Left
                            barButtons.tag = buttonTag
                            barButtons.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            
                        //Custom buttons with image created like this.
                            let barButtonItem = UIBarButtonItem(customView: barButtons)
                            buttonTag += 10
                            navigationItem.leftBarButtonItem = barButtonItem
                            
                        } else {
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.setImage(buttonImage![i - 1], forState: UIControlState.Normal)
                            button.contentHorizontalAlignment = .Right
                            
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
//                            barButtonItem.setBackgroundImage(buttonImage![buttonImage!.count - 1], forState: .Disabled, barMetrics: .Default)
//                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
//                            barButtonItem.tag = buttonTag
//                            buttonTag += 10
//                            navigationItmes.append(barButtonItem)
                        }
                    }
                    
                    navigationItem.rightBarButtonItems = navigationItmes
                }
            }
            
            self.setItems([navigationItem], animated: false)
        
        } else if barTitle != "" && numberOfButtons == 5 {      //Number of buttons are Five...
            
        //Navigation Right button Items array...
            var navigationItmes = [UIBarButtonItem]()
            
            if indexOFButtonToSetTitle! - 1 == 0 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == indexOFButtonToSetTitle! - 1 {          //title on the left && buttons on right
                        
                        //label for title has already been created on top...of this method...
                        
                    } else {
                        
                    //create buttons on right side
                        if i == numberOfButtons! - 1 {
                            
                            //create button...
                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            barButtonItem.tag = buttonTag
                            navigationItmes.append(barButtonItem)
                            
                        } else {
                            
                        //create button...
                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            barButtonItem.tag = buttonTag
                            navigationItmes.append(barButtonItem)
                        }
                        
                        navigationItem.rightBarButtonItems = navigationItmes
                        buttonTag += 10
                    }
                }
                
            } else if indexOFButtonToSetTitle! - 1 == 1 {
                
                for i in 0 ..< numberOfButtons! {
                    
                    if i == 1 {          //title in center of the left && right button
                        
                        //label for title has already been created on top...of this method...
                        
                        
                    } else {
                        
                        if i == numberOfButtons! - 1 {      //create buttons on right side
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.setImage(buttonImage![buttonImage!.count - 1], forState: UIControlState.Normal)
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![buttonImage!.count - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
//                            barButtonItem.tag = buttonTag
//                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
//                            buttonTag += 10
//                            navigationItmes.append(barButtonItem)
                            
                        } else if i == 0 {  //Back button Left side...
                            
                        //create button...
                            let barButtons = UIButton(frame: CGRect(x: aspectWidth(10), y: 20, width: 35, height: self.frame.height - 20))
                            barButtons.setImage(buttonImage![0], forState: UIControlState.Normal)
                            barButtons.setImage(buttonHighlightedImage![0], forState: UIControlState.Highlighted)
                            barButtons.contentHorizontalAlignment = .Left
                            barButtons.tag = buttonTag
                            barButtons.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            
                        //Custom buttons with image created like this.
                            let barButtonItem = UIBarButtonItem(customView: barButtons)
                            buttonTag += 10
                            navigationItem.leftBarButtonItem = barButtonItem
                            
                        } else {
                            
                            let button: UIButton = UIButton(type: UIButtonType.System)
                            button.setImage(buttonImage![i - 1], forState: UIControlState.Normal)
                            button.addTarget(self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                            button.frame = CGRectMake(0, 0, 30, 30)
                            button.tintColor = COLOR_CODE.YELLOW_COLOR
                            let barButtonItem = UIBarButtonItem(customView: button)
                            
                        //create button...
//                            let barButtonItem = UIBarButtonItem(image: buttonImage![i - 1], style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CustomizedDefaultNavigationBar.barItemAction(_:)))
                            barButtonItem.tintColor = COLOR_CODE.YELLOW_COLOR
                            button.tag = buttonTag
                            barButtonItem.tag = buttonTag
                            buttonTag += 10
                            navigationItmes.append(barButtonItem)
                        }
                    }
                }
                

                navigationItem.rightBarButtonItems = navigationItmes
            }
            
            self.setItems([navigationItem], animated: false)
        }
        
        self.navigationBarIten = navigationItem
    }
    
//MARK: Navigation Bar Itma Actions...
    func barItemAction(sender: UIButton) {

        self.delegateNavigation?.barItemsAction!(sender)
    }
}
