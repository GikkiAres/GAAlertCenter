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
  [GAAlertCenter showAlertViewWithTitle:@"title" message:@"message" cancelButtonTitle:@"取消" otherButtonTitleArray:@[@"按时"] tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
    if(buttonIndex == 1) {
    NSLog(@"block");
    }
  }];
}

@end
