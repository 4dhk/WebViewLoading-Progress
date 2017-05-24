//
//  ViewController.m
//  RayWebViewProgress
//
//  Created by 罗雷雷 on 2017/1/12.
//  Copyright © 2017年 4D. All rights reserved.
//

#import "ViewController.h"
#import "LLLWebViewProgressView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    __weak IBOutlet UIWebView *_webView;
    LLLWebViewProgressView *_progressView;
    LLLWebViewProgress *_progressProxy;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //页面出现时 在导航上 加上自定义的ProgressView
    [self.navigationController.navigationBar addSubview:_progressView];
}

//页面消失后移除自定义的ProgressView 因为导航条是和其他界面一起共享的
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}

- (IBAction)searchWihGoogle:(id)sender {
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.google.com"]];
    [_webView loadRequest:req];
}

- (IBAction)refreshAction:(id)sender {
    [_webView reload];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //实现代理
    _progressProxy = [[LLLWebViewProgress alloc] init];//初始化代理
    _webView.delegate = _progressProxy;//设置当前webView的代理
    _progressProxy.webViewProxyDelegate = self;//设置webView的代理
    _progressProxy.progressDelegate = self;//实现progress的代理
    
    
    CGFloat progressBarHeight = 2.0f;//设置
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    
    //自定义的进度条
    _progressView = [[LLLWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    
    [self loadGoogle];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadGoogle
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.chinadaily.com.cn"]];
    [_webView loadRequest:req];
}


//实现progress的协议方法 并且设置title
#pragma mark - LLLWebViewProgressDelegate
-(void)webViewProgress:(LLLWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
