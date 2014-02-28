//
//  SWAlumno.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 27/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWAlumno.h"

@implementation SWAlumno

- (id)initWithNombre:(NSString *)unNombre
            apellido:(NSString *)unApellido
             yCorreo:(NSString *)unCorreo {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  self = [super init];
  if (self) {
    _nombre = unNombre;
    _apellidos = unApellido;
    _email = unCorreo;
    _ciudad = @"Oleiros";
    _avatarUrl = @"";
  }
  return self;
}

- (id)initWithDictionary:(NSDictionary *)dic {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  self = [super init];
  if (self) {
    _nombre = [dic objectForKey:@"nombre"];
    _apellidos = [dic objectForKey:@"apellidos"];
    _email = [dic objectForKey:@"email"];
    _ciudad = [dic objectForKey:@"ciudad"];
    _avatarUrl = [dic objectForKey:@"avatar_url"];
  }
  return self;
}

#pragma mark - KeyedArchive
- (id)initWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  self = [[SWAlumno alloc] init];
  
  _nombre = [coder decodeObjectForKey:@"nombre"];
  _apellidos = [coder decodeObjectForKey:@"apellidos"];
  _email = [coder decodeObjectForKey:@"email"];
  _ciudad = [coder decodeObjectForKey:@"ciudad"];
  _avatarUrl = [coder decodeObjectForKey:@"avatar"];
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [coder encodeObject:_nombre forKey:@"nombre"];
  [coder encodeObject:_apellidos forKey:@"apellidos"];
  [coder encodeObject:_email forKey:@"email"];
  [coder encodeObject:_ciudad forKey:@"ciudad"];
  [coder encodeObject:_avatarUrl forKey:@"avatar"];
}


- (NSString *)nombreCompleto {
  return [_nombre stringByAppendingFormat:@" %@", _apellidos];
}

@end
