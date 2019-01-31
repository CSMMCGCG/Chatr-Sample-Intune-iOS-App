//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  Code for inserting link adopted from: https://stackoverflow.com/questions/39238366/uitextvie-with-hyperlink-text response by Code Different

import UIKit

class AboutUsPage: UIViewController, UITextViewDelegate, IntuneMAMPolicyDelegate{
    
    // variables used throughout this class
    @IBOutlet weak var aboutUsText: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up the link and text that will be displayed on the About us page
        let developerGuide: [NSAttributedString.Key : Any] = [.link: NSURL(string: "https://docs.microsoft.com/intune/app-sdk-ios")!, .foregroundColor: UIColor.blue]
        let text = NSMutableAttributedString(string: "Chatr was built to demonstrate the integration of line-of-business apps with Microsoft Intune's iOS MAM SDK. Chatr is a messaging application that allows users to save and print their conversation transcript. \n \nMore information about the SDK is available here. \n \nCurrent SDK Version: \(IntuneMAMVersionInfo.sdkVersion())")
        text.setAttributes(developerGuide, range: NSMakeRange(256, 4))
        
        // assign the link and text to the page
        self.aboutUsText.delegate = self
        self.aboutUsText.attributedText = text
        self.aboutUsText.isUserInteractionEnabled = true
        self.aboutUsText.isEditable = false
        self.aboutUsText.layer.cornerRadius = 10
        self.backButton.setImage(#imageLiteral(resourceName: "backarrow.png"), for: UIControl.State.normal)
        self.backButton.imageView!.contentMode = .scaleAspectFit
    }
}
