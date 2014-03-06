//
//  SWClase.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWClase.h"

@implementation SWClase

- (id)initWithDic:(NSDictionary *)dic {
  self = [super init];
  if (self) {
    _name = [dic objectForKey:@"name"];
    _description = [dic objectForKey:@"description"];
    _startsAt = [dic objectForKey:@"starts_at"];
    _endsAt = [dic objectForKey:@"ends_at"];
  }
  return self;
}

@end
