//
//  Alumno.m
//  objc
//
//  Created by Pablo Formoso Estada on 20/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Alumno.h"

@implementation Alumno

- (id)initConNombre:(NSString *)unNombre yApellido:(NSString *)unApellido {
  self = [super init];
  
  if (self) {
    _nombre = unNombre;
    _apellidos = unApellido;
  }
  
  return self;
}

/*
 */
- (NSString *)nombreCompleto {
  return [_nombre stringByAppendingFormat:@" %@", _apellidos];
}

#pragma mark - Protocolo de asistencia
- (BOOL)confirmarAsistencia {
  return YES;
}

- (BOOL)cancelarAsistencia {
  return NO;
}

- (void)pedirInfo {
  NSLog(@"El curso sobre iOS empieza el día 20");
}

#pragma mark - uso de bloques
- (void)usarBloque:(void (^)(void))bloqueDeCodigo {
#ifndef NDEBUG
  NSLog(@"%s (line:%d) INICIO BLOQUE", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  bloqueDeCodigo();
  
#ifndef NDEBUG
  NSLog(@"%s (line:%d) FIN BLOQUE", __PRETTY_FUNCTION__, __LINE__);
#endif
}

@end
