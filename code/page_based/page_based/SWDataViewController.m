//
//  SWDataViewController.m
//  page_based
//
//  Created by Pablo Formoso Estada on 21/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWDataViewController.h"

@interface SWDataViewController ()

@end

@implementation SWDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
