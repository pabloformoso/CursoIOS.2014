//
//  AsisenciaDelegado.h
//  objc
//
//  Created by Pablo Formoso Estada on 20/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AsisenciaDelegado <NSObject>

- (BOOL)confirmarAsistencia;
- (BOOL)cancelarAsistencia;

@optional

- (void)pedirInfo;

@end
