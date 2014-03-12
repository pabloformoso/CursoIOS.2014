//
//  SWPostResourceImageService.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 12/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
@class SWResource;
#import <Foundation/Foundation.h>

@interface SWPostResourceImageService : NSObject

- (void)postResource:(SWResource *)res forController:(id)aController;

@end
