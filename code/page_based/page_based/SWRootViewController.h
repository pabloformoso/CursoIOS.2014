//
//  SWRootViewController.h
//  page_based
//
//  Created by Pablo Formoso Estada on 21/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWRootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
