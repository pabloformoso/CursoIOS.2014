//
//  SWMapViewController.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 13/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

#import "SWLocationManager.h"

@interface SWMapViewController : UIViewController <SWLocationManagerDelegate, MKMapViewDelegate, MKOverlay>

@end
