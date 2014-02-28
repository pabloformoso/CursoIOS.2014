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

- (NSString *)nombreCompleto {
  return [_nombre stringByAppendingFormat:@" %@", _apellidos];
}

@end
