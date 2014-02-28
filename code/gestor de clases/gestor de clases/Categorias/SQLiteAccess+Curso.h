//
//  SQLiteAccess+Curso.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 28/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
@class SWAlumno;
#import "SQLiteAccess.h"

@interface SQLiteAccess (Curso)

+ (NSString *)consultarPrimerNombre;
+ (SWAlumno *)seleccionarAlumno:(NSString *)email;
+ (NSArray *)seleccionarTodosLosAlumnos;

@end
