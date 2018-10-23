//
//  ViewController.m
//  EncrptionDemo
//
//  Created by Texowave PVT LTD on 04/10/18.
//  Copyright © 2018 Texowave PVT LTD. All rights reserved.
//

#import "MMSecret.h"
#import <CocoaSecurity.h>
//#import "AESCrypto/AESCrypt.h"
//#import "GTMDefines.h"
//#import "GTMBase64.h"
//#import "NSData+AES.h"
#import <AdSupport/AdSupport.h>

@interface MMSecret ()

@end

@implementation MMSecret

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}
-(void)AlertMsg:(NSString *)Msg{
    UIAlertController *alert=[ UIAlertController alertControllerWithTitle:@"MMSecret" message:Msg preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraaction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
    [alert addAction:cameraaction];
    [self presentViewController:alert animated:YES
                     completion:nil];
}
- (IBAction)ShowResults:(id)sender {
    if (self.txtValueFiled.text.length<=3) {
        [self AlertMsg:@"Enter Correct Value"];
    }else if (self.txtSecretKey.text.length!=16){
        [self AlertMsg:@"Enter KEY 16 Charcter or Number"];
    }else if (self.txtIVKey.text.length!=16){
        [self AlertMsg:@"Enter IVKEY 16 Charcter or Number"];
    }
    else{
        if (self.Segment.selectedSegmentIndex==0) {
            self.txtShowResults.text = [self EncryptResult:self.txtValueFiled.text and_SecretKEY:self.txtSecretKey.text and_IVKey:self.txtIVKey.text];
        }else if (self.Segment.selectedSegmentIndex==1){
            self.txtShowResults.text = [self DecryptResult:self.txtValueFiled.text and_SecretKEY:self.txtSecretKey.text and_IVKey:self.txtIVKey.text];
        }
    }
}
-(NSString *)EncryptResult:(NSString*)Value and_SecretKEY:(NSString*)Key and_IVKey:(NSString*)IVKey{
    NSString *Result;
    NSData *NewdataEncy = [Value dataUsingEncoding:NSUTF8StringEncoding];
    NSData *newdataKey = [Key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *newdataIv = [IVKey dataUsingEncoding:NSUTF8StringEncoding];
    CocoaSecurityResult * ResultEncy = [CocoaSecurity aesEncryptWithData:NewdataEncy key:newdataKey iv:newdataIv];
    Result = [ResultEncy base64];
    return Result;
}
-(NSString *)DecryptResult:(NSString*)Value and_SecretKEY:(NSString*)Key and_IVKey:(NSString*)IVKey{
    NSString *Result;
//    NSData *dataValue = [Value dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataKey = [Key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataIv = [IVKey dataUsingEncoding:NSUTF8StringEncoding];
    CocoaSecurityResult * ResultDecy = [CocoaSecurity aesDecryptWithBase64:Value key:dataKey iv:dataIv];
    Result = [ResultDecy utf8String];
    return Result;
}
- (IBAction)ChangeSegamate:(id)sender {
    if (self.Segment.selectedSegmentIndex==0) {
        [self AlertMsg:@"Encprt Mode"];
    }else if(self.Segment.selectedSegmentIndex==1){
        [self AlertMsg:@"Decprt Mode"];
    }
}
@end
