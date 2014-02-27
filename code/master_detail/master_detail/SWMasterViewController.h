//
//  SWMasterViewController.h
//  master_detail
//
//  Created by Pablo Formoso Estada on 21/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDetailViewController;

@interface SWMasterViewController : UITableViewController

@property (strong, nonatomic) SWDetailViewController *detailViewController;

@end
