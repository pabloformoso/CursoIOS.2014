//
//  SWLocationManager.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWLocationManager.h"

@implementation SWLocationManager

@synthesize locationManager;
@synthesize delegate;

- (id) init {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
    self = [super init];
    
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
    if ((newLocation.coordinate.latitude > oldLocation.coordinate.latitude + 0.0000002) ||
        (newLocation.coordinate.latitude < oldLocation.coordinate.latitude - 0.00000002) ||
        (newLocation.coordinate.longitude > oldLocation.coordinate.longitude + 0.00000002) ||
        (newLocation.coordinate.longitude < oldLocation.coordinate.longitude - 0.00000002)){
        [self.delegate locationUpdate:newLocation];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif 
    
	[self.delegate locationError:error];
}

@end
