//
//  GAAlertCenter.m
//  GAAlertCenter
//
//  Created by GikkiAres on 9/20/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import "GAAlertCenter.h"
#import <objc/runtime.h>

static const void *GAAlertViewTapBlockKey = &GAAlertViewTapBlockKey;
static const void *GAActionSheetTapBlockKey = &GAActionSheetTapBlockKey;


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
    objc_setAssociatedObject(alertView, GAAlertViewTapBlockKey, tapBlock, OBJC_ASSOCIATION_COPY);
  }
  
  [alertView show];
}

+(void)showActionSheetInView:(UIView *)view withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray tapBlock:(GAAlertViewTapBlock)tapBlock {
  
  UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title delegate:(id<UIActionSheetDelegate>)self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
  
  if (otherButtonTitleArray.count > 0) {
    for (NSString *buttonTitle in otherButtonTitleArray) {
      [actionSheet addButtonWithTitle:buttonTitle];
    }
  }
  
  if (tapBlock) {
    objc_setAssociatedObject(actionSheet, GAActionSheetTapBlockKey, tapBlock, OBJC_ASSOCIATION_COPY);
  }
  
  [actionSheet showInView:view];
  
}





+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  GAAlertViewTapBlock tapBlock = objc_getAssociatedObject(alertView, GAAlertViewTapBlockKey);
  if(tapBlock) {
    tapBlock(alertView,buttonIndex);
  }
  objc_setAssociatedObject(alertView, GAAlertViewTapBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
}

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  GAActionSheetTapBlock tapBlock = objc_getAssociatedObject(actionSheet, GAActionSheetTapBlockKey);
  if(tapBlock) {
    tapBlock(actionSheet,buttonIndex);
  }
  objc_setAssociatedObject(actionSheet, GAActionSheetTapBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
}


@end
