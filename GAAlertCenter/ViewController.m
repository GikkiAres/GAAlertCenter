//
//  ViewController.m
//  GAAlertCenter
//
//  Created by GikkiAres on 9/20/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "ViewController.h"
#import "GAAlertCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)clickBtn1:(id)sender {
  [GAAlertCenter showAlertViewWithTitle:@"title" message:@"message" cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"1",@"2",@"3"] tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
   NSLog(@"%@",@(buttonIndex).description);
  }];
}
- (IBAction)clickBtn2:(id)sender {
 [GAAlertCenter showActionSheetInView:self.view withTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitleArray:@[@"1相机",@"2相册",@"3信息"] tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
   NSLog(@"%@",@(buttonIndex).description);
 }];
}

@end
