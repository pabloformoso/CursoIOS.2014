//
//  main.m
//  objc
//
//  Created by Pablo Formoso Estada on 19/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights

#import "Alumno.h"
#import "NSString+Alumno.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool {
    Alumno *pablo = [[Alumno alloc] initConNombre:@"Pablo" yApellido:@"Formoso"];
    NSLog(@"El alumno se llama %@", [pablo nombreCompleto]);
    
    if ([pablo confirmarAsistencia]) {
      NSLog([@"Bienvenido " saludarAlAlumno:pablo]);
    }
    
    if ([pablo respondsToSelector:@selector(pedirInfo)]) {
      [pablo performSelector:@selector(pedirInfo) withObject:nil];
    }
    
    [pablo usarBloque:^{
#ifndef NDEBUG
      NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
      NSLog(@"Estamos ejecutando un bloque de código");
    }];
    
  }
  
  return 0;
}

