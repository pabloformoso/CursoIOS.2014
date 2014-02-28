//
//  SWAlumno.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 27/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWAlumno : NSObject

- (id)initWithNombre:(NSString *)unNombre
            apellido:(NSString *)unApellido
             yCorreo:(NSString *)unCorreo;

@property(nonatomic, strong) NSString *nombre;
@property(nonatomic, strong) NSString *apellidos;
@property(nonatomic, strong) NSString *ciudad;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *avatarUrl;

- (NSString *)nombreCompleto;

@end
