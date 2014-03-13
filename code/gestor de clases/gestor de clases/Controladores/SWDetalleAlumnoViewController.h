//
//  SWDetalleAlumnoViewController.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 28/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
@class SWAlumno;
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SWDetalleAlumnoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *ciudadLabel;

- (void)loadData:(SWAlumno *)unAlumno;
- (IBAction)back:(id)sender;
- (IBAction)doubleTapTouch:(id)sender;

@end
