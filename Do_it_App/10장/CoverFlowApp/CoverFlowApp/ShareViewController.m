//
//  ShareViewController.m
//  SecretApp
//
//  Created by young soeb on 10. 9. 8..
//  Copyright 2010 home. All rights reserved.
//

#import "ShareViewController.h"

@implementation ShareViewController


@synthesize  pSelectCardIndex;

@synthesize  pRootViewController;
//synthesize  pEMailButton;

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/* ---------
- (void)dealloc {
    [super dealloc];
	
	if (imagePicker != nil) [imagePicker release];
}
*/

#pragma mark 메일전송

- (IBAction) MailSender
{

	NSString *imageName = [[NSString alloc] initWithFormat:@"Body_%d", pSelectCardIndex+1];
	NSString *imageName1 = [[NSString alloc] initWithFormat:@"Body_%d.png", pSelectCardIndex+1];
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];

	UIImage *image = [UIImage imageNamed:imageName1];
	
	NSData *data = UIImagePNGRepresentation(image);
	[picker addAttachmentData:data mimeType:@"image/png" fileName:imageName1];
	NSString *tempStr =	[[NSString alloc] initWithFormat:@"커버플로우 샘플 이미지%@", @""];
	NSString *tempBodyStr =	[[NSString alloc] initWithFormat:@"이미지가 도착했습니다"];

	
	[picker setMessageBody:tempBodyStr isHTML:NO];
	[picker setSubject: tempStr];
	picker.mailComposeDelegate = self;
	[self presentViewController:picker animated:YES completion:nil];


 }


#pragma mark -
#pragma mark 메일 델리게이트
- (void)mailComposeController:(MFMailComposeViewController*)controller 
		  didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	switch (result) {
		case MFMailComposeResultCancelled:
			break;
		case MFMailComposeResultSaved:
			break;
		case MFMailComposeResultSent:
			[[[UIAlertView alloc] initWithTitle:@"성공" 
										message:@"성공적으로 보냈습니다." 
									   delegate:nil 
							  cancelButtonTitle:@"확인" 
							  otherButtonTitles:nil] show];
			break;
		case MFMailComposeResultFailed:
			[[[UIAlertView alloc] initWithTitle:@"실패" 
										message:@"전송에 실패했습니다." 
									   delegate:nil 
							  cancelButtonTitle:@"확인" 
							  otherButtonTitles:nil] show];
			break;
	};
	[controller dismissViewControllerAnimated:YES completion:nil];
}




- (void)messageComposeViewController:(MFMessageComposeViewController *)controller 
                 didFinishWithResult:(MessageComposeResult) result {
	
    // -- Notifies users about errors associated with the interface
    switch (result) {
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultSent:
			[[[UIAlertView alloc] initWithTitle:@"성공" 
										message:@"성공적으로 보냈습니다." 
									   delegate:nil 
							  cancelButtonTitle:@"확인" 
							  otherButtonTitles:nil] show];
            break;
        case MessageComposeResultFailed:
			[[[UIAlertView alloc] initWithTitle:@"실패" 
										message:@"전송에 실패했습니다." 
									   delegate:nil 
							  cancelButtonTitle:@"확인" 
							  otherButtonTitles:nil] show];
            break;
			
        default:
			
            break;
    }
    
	[controller dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark Facebook
-(IBAction) FacebookClick
{
/*
	FaceBookViewController * facebookView = [[FaceBookViewController alloc] init];
	facebookView.pShareViewController = self;
	
	facebookView.pSelectCardIndex = pSelectCardIndex;
	
	
	[self presentViewController:facebookView animated:YES completion:nil];
	[facebookView release];
	
  */  
	
}



-(IBAction) CancelClick
{
	
	
}



@end
