//
//  SWPostResourceImageService.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 12/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "AFNetworking.h"
#import "SWResource.h"
#import "SWPostResourceImageService.h"

@interface SWPostResourceImageService ()
@property (nonatomic, assign) id controller;
@end

@implementation SWPostResourceImageService

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
  
  [manger POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    
    [formData appendPartWithFileData:UIImageJPEGRepresentation(res.image, 0.5)
                                name:@"resource[photo]"
                            fileName:@"temp.png"
                            mimeType:@"image/png"];
    
  } success:^(AFHTTPRequestOperation *operation, id responseObject) {
#ifndef NDEBUG
    NSLog(@"%s (line:%d) Creado correctamente", __PRETTY_FUNCTION__, __LINE__);
#endif
    
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
