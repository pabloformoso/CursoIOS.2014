//
//  SWDetalleAlumnoViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 28/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "AudioStreamer.h"
#import "SWAlumno.h"
#import "UIImageView+AFNetworking.h"
#import "SWDetalleAlumnoViewController.h"

@interface SWDetalleAlumnoViewController ()
@property(nonatomic, strong) SWAlumno *alumno;
//http://79.116.217.120:8000/test.aac
@property(nonatomic, strong) AudioStreamer *player;
@end

@implementation SWDetalleAlumnoViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidLoad];
  
  NSURL *url = [NSURL URLWithString:@"http://80.86.106.136"];
  _player = [[AudioStreamer alloc] initWithURL:url];
  [_player start];
  
  [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
#ifndef NDEBUG
    NSLog(@"%s (line:%d) tarea expirada", __PRETTY_FUNCTION__, __LINE__);
#endif
  }];
  [self becomeFirstResponder];
  
}

- (BOOL)canBecomeFirstResponder {
  return YES;
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
  /*
  [_avatarImageView setImageWithURL:imgUrl
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
  */
  
  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:imgUrl];
  [_avatarImageView setImageWithURLRequest:req
                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]
  success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
    _avatarImageView.image = image;
    
    //[CATransaction setDisableActions:NO];
    //[CATransaction setAnimationDuration:1000];
    
    CALayer *layer = _avatarImageView.layer;
    
    [UIView animateWithDuration:5 animations:^{
      
      layer.opacity = .3f;
      layer.cornerRadius = 100.0f;
      layer.frame = CGRectMake(0, 0, 500, 500);
      
    } completion:^(BOOL finished) {
      [UIView beginAnimations:@"Restore" context:nil];
      [UIView setAnimationDuration:4];
      
      layer.opacity = 1.0f;
      layer.cornerRadius = .0f;
      layer.frame = CGRectMake(0, 0, 320, 265);
      
      [UIView commitAnimations];
    }];
    
  } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) Error cargando la imagen %@\n%@", __PRETTY_FUNCTION__, __LINE__,
          _alumno.avatarUrl,
          [error localizedDescription]);
#endif
  }];
}

- (void)viewDidDisappear:(BOOL)animated {
  [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
  [self resignFirstResponder];
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

- (IBAction)back:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doubleTapTouch:(id)sender {
  CALayer *layer = _avatarImageView.layer;
  
  [UIView animateWithDuration:5 animations:^{
    
    layer.opacity = .3f;
    layer.cornerRadius = 100.0f;
    layer.frame = CGRectMake(0, 0, 500, 500);
    
  } completion:^(BOOL finished) {
    [UIView beginAnimations:@"Restore" context:nil];
    [UIView setAnimationDuration:4];
    
    layer.opacity = 1.0f;
    layer.cornerRadius = .0f;
    layer.frame = CGRectMake(0, 0, 320, 265);
    
    [UIView commitAnimations];
  }];
}

#pragma mark - Remote Control Events
- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
#ifndef NDEBUG
  NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
  
  switch (receivedEvent.subtype) {
    case UIEventSubtypeRemoteControlTogglePlayPause:
      if (_player.isPlaying) {
        [_player pause];
      } else {
        [_player start];
      }
      break;
      
    case UIEventSubtypeRemoteControlPreviousTrack:
      break;
      
    case UIEventSubtypeRemoteControlNextTrack:
      break;
      
    default:
      break;
  }
}

@end
