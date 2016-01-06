//
//  ViewController.h
//  HelloWorld
//
//  Created by 소영섭 on 2014. 12. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)inputTextToTextView:(id)sender;
- (IBAction)buttonTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)switchTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
