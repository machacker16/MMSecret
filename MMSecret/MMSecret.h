//
//  ViewController.h
//  EncrptionDemo
//
//  Created by Texowave PVT LTD on 04/10/18.
//  Copyright © 2018 Texowave PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSecret : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtValueFiled;
@property (strong, nonatomic) IBOutlet UITextField *txtSecretKey;
@property (strong, nonatomic) IBOutlet UITextField *txtIVKey;
- (IBAction)ShowResults:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *txtShowResults;
@property (strong, nonatomic) IBOutlet UISegmentedControl *Segment;
- (IBAction)ChangeSegamate:(id)sender;


@end

