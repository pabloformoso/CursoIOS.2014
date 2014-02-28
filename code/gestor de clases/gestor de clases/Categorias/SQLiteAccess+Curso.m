//
//  SQLiteAccess+Curso.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 28/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "SWAlumno.h"
#import "SQLiteAccess+Curso.h"

@implementation SQLiteAccess (Curso)

+ (NSString *)consultarPrimerNombre {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSString *query = @"SELECT nombre FROM alumnos";
  return [SQLiteAccess selectOneValueSQL:query];
}

+ (SWAlumno *)seleccionarAlumno:(NSString *)email {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  NSString *query = [@"SELECT nombre FROM alumnos WHERE email = " stringByAppendingFormat:@"'%@'", email];
  NSDictionary *dic = [SQLiteAccess selectOneRowWithSQL:query];
  
  return [[SWAlumno alloc] initWithDictionary:dic];
}

+ (NSArray *)seleccionarTodosLosAlumnos {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  NSString *query = @"SELECT * FROM alumnos";
  NSArray *tmpArray = [SQLiteAccess selectManyRowsWithSQL:query];
  NSMutableArray *returnArray = [[NSMutableArray alloc] init];
  
  for (NSDictionary *dic in tmpArray) {
    SWAlumno *al = [[SWAlumno alloc] initWithDictionary:dic];
    [returnArray addObject:al];
  }

  return returnArray;
}

@end
