//
//  SWResource.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWResource.h"

@implementation SWResource

- (id)initWithJSonDictionary:(NSDictionary *)dic {
  self = [super init];
  
  if (self) {
    _recursoId = [[dic valueForKey:@"id"] integerValue];
    _name = [dic objectForKey:@"name"];
    _link = [dic objectForKey:@"link"];
    _description = [dic objectForKey:@"description"];
    _photo_url = [dic objectForKey:@"photo_url"];
  }
  
  return self;
}

- (BOOL)isPhoto {
  return (_photo_url && (_photo_url.length > 1));
}

@end
