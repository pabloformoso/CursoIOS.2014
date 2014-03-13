//
//  SWMapViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 13/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
//  43.337449,-8.406902
//
#import "SWMapPin.h"
#import "SWMapViewController.h"

@interface SWMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocation *lastLocation;
@property (nonatomic, strong) SWLocationManager *manager;
@end

@implementation SWMapViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewDidLoad];
  
  _manager = [[SWLocationManager alloc] init];
  [_manager setDelegate:self];
  [_manager.locationManager setActivityType:CLActivityTypeAutomotiveNavigation];
  
  [self dropPins];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [_manager.locationManager startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [_manager.locationManager stopUpdatingLocation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - SWLocationManagerDelegate
- (void)locationUpdate:(CLLocation *)location {
#ifndef NDEBUG
  NSLog(@"%s (line:%d) \n{ %.8f , %.8f }", __PRETTY_FUNCTION__, __LINE__,
        location.coordinate.latitude,
        location.coordinate.longitude);
#endif
  
  _lastLocation = location;
  
  MKCoordinateRegion region;
  MKCoordinateSpan span;
  
  span.latitudeDelta = 0.005;
  span.longitudeDelta = 0.005;
  
  region.span = span;
  region.center = CLLocationCoordinate2DMake(_lastLocation.coordinate.latitude, _lastLocation.coordinate.longitude);
  
  [_mapView setRegion:region animated:YES];
}

- (void)locationError:(NSError *)error {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
}

#pragma mark - MapDelegate & methods
//  43.337449,-8.406902
- (void)dropPins {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  SWMapPin *pin1 = [[SWMapPin alloc] initWithTitle:@"Citic"
                                          subtitle:@"Centro de investigación"
                                    andCoordinates:CLLocationCoordinate2DMake(43.337449, -8.406902)];
  
  SWMapPin *pin2 = [[SWMapPin alloc] initWithTitle:@"Sitio 1"
                                          subtitle:@"A ver donde cae"
                                    andCoordinates:CLLocationCoordinate2DMake(43.336500, -8.406050)];
  
  SWMapPin *pin3 = [[SWMapPin alloc] initWithTitle:@"Sitio 2"
                                          subtitle:@"O chou"
                                    andCoordinates:CLLocationCoordinate2DMake(43.339299, -8.406720)];
  
  [_mapView addAnnotations:@[pin1,pin2,pin3]];
  
  [self drawPolyline];
}

- (void)drawPolyline {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  CLLocationCoordinate2D coordinates[3];
  // En caso de recibir un CLLocaton del locationManager
  CLLocation *location1 = [[CLLocation alloc] initWithLatitude:43.337449
                                                    longitude:-8.406902];
  
  CLLocationCoordinate2D coord1 = location1.coordinate;
  coordinates[1] = coord1;
  
  // Coordenadas con el CL2DMake
  coordinates[0] = CLLocationCoordinate2DMake(43.336500, -8.406050);
  coordinates[2] = CLLocationCoordinate2DMake(43.339299, -8.406720);
  
  MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:3];
  [_mapView addOverlay:polyline];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  MKPolylineView *polylineView = [[MKPolylineView alloc] initWithOverlay:overlay];
  
  [polylineView setStrokeColor:[UIColor blackColor]];
  [polylineView setLineWidth:5.0f];
  
  return polylineView;
}
                          
                          
                          
                          
                          
@end
