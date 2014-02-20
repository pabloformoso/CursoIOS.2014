//
//  Alumno.h
//  objc
//
//  Created by Pablo Formoso Estada on 20/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights

#import "AsisenciaDelegado.h"

@interface Alumno : NSObject <AsisenciaDelegado>

// public Alumno(String nombre, String apellido)
- (id)initConNombre:(NSString *)unNombre yApellido:(NSString *)unApellido;

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *apellidos;

- (NSString *)nombreCompleto;
- (void)usarBloque:(void (^)(void))bloqueDeCodigo;

@end
