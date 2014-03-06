//
//  SWAlumnosXMLService.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "BaseXmlParser.h"

@interface SWAlumnosXMLService : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (void)getAlumnosXML:(id)aController;

@end
