//
//  NSString+Alumno.m
//  objc
//
//  Created by Pablo Formoso Estada on 20/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "Alumno.h"
#import "NSString+Alumno.h"

@implementation NSString (Alumno)

- (NSString *)saludarAlAlumno:(Alumno *)al {
  return [self stringByAppendingString:[al nombreCompleto]];
}

@end
