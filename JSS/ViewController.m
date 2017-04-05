//
//  ViewController.m
//  JSS
//
//  Created by contact on 2015/9/5.
//  Copyright © 2015年 contact. All rights reserved.
//

#import "ViewController.h"
#import "ObjCModel.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jsContext = [[JSContext alloc]init];
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:_webView];
    NSString *str = [[NSBundle mainBundle] pathForResource:@"test的副本" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:str]]];

}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //注意,获取webview的jsContext的固定写法
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 通过模型调用方法，这种方式更好些。(控制器中都不需要写辣么多互调代码啦,只需把jsContext与webView传过去就行了)
    ObjCModel *model  = [[ObjCModel alloc] init];
    self.jsContext[@"OCModel"] = model;
    model.jsContext = self.jsContext;
    model.webView = self.webView;
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"异常信息：%@", exceptionValue);
    };
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
