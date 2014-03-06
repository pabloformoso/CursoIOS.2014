//
//  SWClase.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClase : NSObject

- (id)initWithDic:(NSDictionary *)dic;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *startsAt;
@property (nonatomic, strong) NSString *endsAt;

@end
