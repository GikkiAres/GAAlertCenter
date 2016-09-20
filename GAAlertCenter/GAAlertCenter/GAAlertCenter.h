//
//  GAAlertCenter.h
//  GAAlertCenter
//
//  Created by GikkiAres on 9/20/16.
//  Copyright © 2016 GikkiAres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GAAlertCenter : NSObject <UIAlertViewDelegate>

//点击按钮调用的block
typedef void (^GAAlertViewTapBlock)(UIAlertView *alertView,NSInteger buttonIndex);

+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray tapBlock:(GAAlertViewTapBlock)tapBlock;

@end
