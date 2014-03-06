//
//  SWDetalleAlumnoViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 28/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "SWAlumno.h"
#import "UIImageView+AFNetworking.h"
#import "SWDetalleAlumnoViewController.h"

@interface SWDetalleAlumnoViewController ()

@property(nonatomic, strong) SWAlumno *alumno;

@end

@implementation SWDetalleAlumnoViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillAppear:animated];

  [_nombreLabel setText:[_alumno nombreCompleto]];
  [_emailLabel setText:_alumno.email];
  [_ciudadLabel setText:_alumno.ciudad];
  
  NSURL *imgUrl = [NSURL URLWithString:_alumno.avatarUrl];
  [_avatarImageView setImageWithURL:imgUrl
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Métodos públicos
- (void)loadData:(SWAlumno *)unAlumno {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _alumno = unAlumno;
}

@end
