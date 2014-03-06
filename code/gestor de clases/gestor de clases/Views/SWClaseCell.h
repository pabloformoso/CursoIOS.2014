//
//  SWClaseCell.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWClaseCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nombre;
@property (nonatomic, weak) IBOutlet UILabel *start;
@property (nonatomic, weak) IBOutlet UILabel *end;

@end
