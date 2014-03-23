//
//  SWViewController.h
//  Video
//
//  Created by Pablo Formoso Estada on 19/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface SWViewController : UIViewController

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) AVPlayer *avPlayer;

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)pause:(id)sender;
@end
