//
//  SWAlumnosXMLService.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
// http://192.168.0.188:3000/stundents.xml

#import "SWAlumno.h"
#import "SWAlumnosXMLService.h"

@interface SWAlumnosXMLService ()

@property (nonatomic, strong) NSMutableData *wipData;
@property (nonatomic, strong) SWAlumno *tmpAlumno;
@property (nonatomic, strong) NSMutableArray *returnArray;
@property (nonatomic, assign) id controller;

@end

@implementation SWAlumnosXMLService

- (void)getAlumnosXML:(id)aController {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _controller = aController;
    NSURL *url = [NSURL URLWithString:[kBaseUrl stringByAppendingString:@"/stundents.xml"]];

  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url
                                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                        timeoutInterval:15];
  
  NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req
                                                                delegate:self];
  
  
  [connection start];
  
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([_controller respondsToSelector:@selector(failData)]) {
    [_controller performSelector:@selector(failData) withObject:nil];
  }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
    NSHTTPURLResponse *httpRespone = (NSHTTPURLResponse *)response;
    int responseCode = httpRespone.statusCode;
    if ((responseCode >= 200) && (responseCode < 300)) {
#ifndef NDEBUG
      NSLog(@"%s (line:%d) conexión correcta", __PRETTY_FUNCTION__, __LINE__);
#endif
      _wipData = [[NSMutableData alloc] init];
    } else {
      if ([_controller respondsToSelector:@selector(failData)]) {
        [_controller performSelector:@selector(failData) withObject:nil];
      }
    }
  }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [_wipData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self parseDocument:_wipData];
  
  if ([_controller respondsToSelector:@selector(setData:)]) {
    [_controller performSelector:@selector(setData:) withObject:_returnArray];
  }
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
  
  if ([elementName isEqualToString:@"stundents"]) {
    _returnArray = [[NSMutableArray alloc] init];
  } else if ([elementName isEqualToString:@"stundent"]) {
    _tmpAlumno = [[SWAlumno alloc] init];
  }
  
  [self clearContentsOfElement];
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
  
  if ([elementName isEqualToString:@"name"]) {
    [_tmpAlumno setNombre:_contentsOfElement];
  } else if ([elementName isEqualToString:@"lastname"]) {
    [_tmpAlumno setApellidos:_contentsOfElement];
  } else if ([elementName isEqualToString:@"city"]) {
    [_tmpAlumno setCiudad:_contentsOfElement];
  } else if ([elementName isEqualToString:@"email"]) {
    [_tmpAlumno setEmail:_contentsOfElement];
  } else if ([elementName isEqualToString:@"image-url"]) {
    [_tmpAlumno setAvatarUrl:
     [@"http://192.168.0.188:3000" stringByAppendingString:_contentsOfElement]
    ];
  }
  
  if ([elementName isEqualToString:@"stundent"]) {
    [_returnArray addObject:_tmpAlumno];
    _tmpAlumno = nil;
  }
  
  [self clearContentsOfElement];
}

@end
