#  What it is about? 

This repository is about how to customizing a default iOS navigation bar with the way you want it i.e. the color, number of buttons, etc.


#  How to Use it?

To use this custom navigation bar you need to first hide the default Navigation that comes with every Navigation Controller. And then add these lines(Below) to your viewDidLoad(:_) function of your controller.

_Adding Navigation Bar ==> _  
Bullet list:
`let navigation = CustomizedDefaultNavigationBar(frame:CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 70), buttonImage: [UIImage("EnterImageName1")....], buttonHighlightedImage:[[UIImage("EnterHighlitedName1")....]] , numberOfButtons: 2, barTitle: "Whatever", alignmentOfTitle: "Center", indexOFButtonToSetTitle: 2)  
navigation.delegateNavigation = self  
self.view.addSubview(navigation)`  


All these above written lines do is Just adding a Customize Navigation Bar to your view controller's View. There are a few parameters that you need to provide as per your requirements.

1) Frames ==> The size of your naviation Bar.  
2) Nav Bar Button's Normal Images ==> Array of images.  
3) Nav Bar Button's Highlighted Images ==> Array of images.  
4) numberOfButtons ==> total Number of Buttons.  
5) barTitle ==> String Value  
6) alignmentOfTitle ==> String Value  
7) indexOFButtonToSetTitle ==> Which button you want to set the title on. (NOTE ==> Based on this title All the Buttons Position is Maintained.)  
8) delegateNavigation ==> Set it to self and implement the required method named ==> barItemsAction(:_), In this function the Actions of different buttons will be implemented on you controller based on Tags.  

NOTE==> Total Number of Buttons are Maintained = 5, Tags are = 10, 20, 30, 40, 50  
NOTE==> Tags starting from Left to right before Title and Right to Left After Title.  


That's All.
