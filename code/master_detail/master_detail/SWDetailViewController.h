//
//  SWDetailViewController.h
//  master_detail
//
//  Created by Pablo Formoso Estada on 21/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
