//
//  SWViewController.m
//  Video
//
//  Created by Pablo Formoso Estada on 19/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWViewController.h"

@interface SWViewController ()

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
  NSURL *url = [NSURL URLWithString:@"http://stream.gravlab.net/003119/sparse/v1d30/posts/2014/barcelona/barcelona.m3u8"];
  // http://stream.gravlab.net/003119/sparse/v1d30/posts/2014/barcelona/barcelona.m3u8
  /*
  _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: url];
  self.view = _moviePlayer.view;
  [_moviePlayer setAllowsAirPlay:NO];
  [_moviePlayer setControlStyle:MPMovieControlStyleNone];
  [_moviePlayer play];
   */
  
  _avPlayer = [[AVPlayer alloc] initWithURL:url];
  AVPlayerLayer *avLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
  avLayer.frame = CGRectMake(20, 20, 280, 177);
  [self.view.layer addSublayer:avLayer];
  
  AVPlayerLayer *avLayer2 = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
  avLayer2.frame = CGRectMake(340, 20, 280, 177);
  [self.view.layer addSublayer:avLayer2];
  
  [_avPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
  [_avPlayer play];
}

- (IBAction)stop:(id)sender {
  [_avPlayer pause];
}

- (IBAction)pause:(id)sender {
  [_avPlayer pause];
}

@end
