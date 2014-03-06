//
//  SWMapPin.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWMapPin.h"

@implementation SWMapPin

- (id)initWithTitle:(NSString *)aTitle
           subtitle:(NSString *)aSubtitle
     andCoordinates:(CLLocationCoordinate2D)aCoordinate {
  
  self = [super init];
  
  if (self) {
    _title = aTitle;
    _subtitle = aSubtitle;
    _coordinate = aCoordinate;
  }
  
  return self;
}

@end
