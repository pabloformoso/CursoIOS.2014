//
//  SWAddResourceViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 07/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "SWResource.h"
#import "SWPostResourceService.h"
#import "SWAddResourceViewController.h"

@interface SWAddResourceViewController ()

@end

@implementation SWAddResourceViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width,
                                         _scrollView.frame.size.height)];
  
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillAppear:animated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(showKeyboard)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(hideKeyboard)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillDisappear:animated];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
  
  SWResource *tmp = [[SWResource alloc] init];
  [tmp setName:_nameTextField.text];
  [tmp setDescription:_descriptionTextField.text];
  [tmp setLink:_urlTextField.text];
  
  SWPostResourceService *ws = [[SWPostResourceService alloc] init];
  [ws postResource:tmp forController:self];
  
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  if (textField == _nameTextField) {
    [_descriptionTextField becomeFirstResponder];
  } else if (textField == _descriptionTextField) {
    [_urlTextField becomeFirstResponder];
  } else if (textField == _urlTextField) {
    [self save:textField];
  }
  
  return YES;
}

#pragma mark - Private Methods
- (void)showKeyboard {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width,
                                         _scrollView.frame.size.height)];
  
  [_scrollView setFrame:CGRectMake(0, 64, 320, 280)];

}

- (void)hideKeyboard {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [_scrollView setFrame:CGRectMake(0, 64, 320, 502)];

}

@end
