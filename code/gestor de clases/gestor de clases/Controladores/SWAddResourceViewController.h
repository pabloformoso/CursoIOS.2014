//
//  SWAddResourceViewController.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 07/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWAddResourceViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
