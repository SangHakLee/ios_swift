//
//  ViewController.m
//  HelloWorld
//
//  Created by 소영섭 on 2014. 12. 11..
//  Copyright (c) 2014년 소영섭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Photo305" ofType:@"jpg"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputTextToTextView:(id)sender {
    [_textView setText:[_textField text]];
}

- (IBAction)buttonTouch:(id)sender {
    NSString *str=[_textField text];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [_webView loadRequest:request];
}
- (IBAction)switchTouch:(id)sender {
    if([_switchButton isOn])
    {
        [_imageView setAlpha:1.0f];
    }
    else
    {
        [_imageView setAlpha:0.0f];
    }
}
@end