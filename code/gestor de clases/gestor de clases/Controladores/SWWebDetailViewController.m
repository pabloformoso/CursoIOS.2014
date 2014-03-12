//
//  SWWebDetailViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 12/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "UIWebView+AFNetworking.h"

#import "SWResource.h"
#import "SWWebDetailViewController.h"

@interface SWWebDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation SWWebDetailViewController


- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidLoad];
  NSURL *url = [NSURL URLWithString:_resource.link];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  [_webview loadRequest:request];
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super didReceiveMemoryWarning];
}

@end
