//
//  GAAlertCenter.m
//  GAAlertCenter
//
//  Created by GikkiAres on 9/20/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "GAAlertCenter.h"
#import <objc/runtime.h>

static const void *GAAlertViewBlockKey = &GAAlertViewBlockKey;



@implementation GAAlertCenter

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray tapBlock:(GAAlertViewTapBlock)tapBlock {
  #if __has_include(<UIKit/UIAlertController.h>)
  
#endif
  NSString *firstOtherTitle = otherButtonTitleArray.count ? otherButtonTitleArray[0] : nil;
  
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                               message:message
                                              delegate:self
                                     cancelButtonTitle:cancelButtonTitle
                                     otherButtonTitles:firstOtherTitle, nil];
  
  alertView.alertViewStyle = UIAlertViewStyleDefault;
  
  if (otherButtonTitleArray.count > 1) {
    for (NSString *buttonTitle in [otherButtonTitleArray subarrayWithRange:NSMakeRange(1, otherButtonTitleArray.count - 1)]) {
      [alertView addButtonWithTitle:buttonTitle];
    }
  }
  
  if (tapBlock) {
    objc_setAssociatedObject(alertView, GAAlertViewBlockKey, tapBlock, OBJC_ASSOCIATION_COPY);
  }
  
  [alertView show];
  
}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  GAAlertViewTapBlock tapBlock = objc_getAssociatedObject(alertView, GAAlertViewBlockKey);
  __weak __typeof(alertView)weakAlertView = alertView;
  if(tapBlock) {
    tapBlock(weakAlertView,buttonIndex);
  }
  objc_setAssociatedObject(alertView, GAAlertViewBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
}


@end
