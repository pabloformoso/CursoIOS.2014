//
//  SWResource.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWResource : NSObject

- (id)initWithJSonDictionary:(NSDictionary *)dic;

@property (nonatomic, assign) int recursoId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *photo_url;

@end
