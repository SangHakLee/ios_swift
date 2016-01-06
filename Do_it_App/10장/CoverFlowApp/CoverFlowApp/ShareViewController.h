//
//  ShareViewController.h
//  SecretApp
//
//  Created by young soeb on 10. 9. 8..
//  Copyright 2010 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>
// -----#import "FaceBookViewController.h"



@class ViewController;

@interface ShareViewController : UIViewController <MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate>
{

	UIImagePickerController *imagePicker;
	int pSelectCardIndex;
}


- (IBAction) MailSender;
- (IBAction) TwitterSender;
- (IBAction) FacebookClick;


@property  int pSelectCardIndex;
@property (nonatomic, retain) ViewController *pRootViewController;
//@property (nonatomic, retain) UIButton *pEMailButton;

@end
