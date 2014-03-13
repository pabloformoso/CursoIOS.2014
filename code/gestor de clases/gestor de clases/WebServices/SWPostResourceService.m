//
//  SWPostResourceService.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "AFNetworking.h"

#import "SWResource.h"
#import "SWPostResourceService.h"

@interface SWPostResourceService ()
@property (nonatomic, assign) id controller;
@end

@implementation SWPostResourceService

- (void)postResource:(SWResource *)res forController:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
  
  AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
  
  NSDictionary *params = @{@"resource[name]": res.name,
                           @"resource[link]": res.link,
                           @"resource[description]": res.description};
  
  NSString *url = [kBaseUrl stringByAppendingString:@"/resources.json"];
  
  [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) Creado correctamente", __PRETTY_FUNCTION__, __LINE__);
#endif
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPostResourceNotification
                                                        object:nil];
     
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"No se ha podido crear el recurso"
                                                   delegate:nil
                                          cancelButtonTitle:@"Aceptar"
                                          otherButtonTitles:nil];
    
    [alert show];
  }];
  
}

@end
