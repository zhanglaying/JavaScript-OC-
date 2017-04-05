//
//  ObjCModel.h
//  JSS
//
//  Created by contact on 2015/9/5.
//  Copyright © 2015年 contact. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "JavaScriptObjectiveCDelegate.h"

@interface ObjCModel : NSObject<JavaScriptObjectiveCDelegate>

@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, weak) UIWebView *webView;

@end
