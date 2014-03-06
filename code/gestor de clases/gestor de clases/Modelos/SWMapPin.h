//
//  SWMapPin.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface SWMapPin : NSObject <MKAnnotation>

- (id)initWithTitle:(NSString *)aTitle
           subtitle:(NSString *)aSubtitle
     andCoordinates:(CLLocationCoordinate2D)aCoordinate;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end
