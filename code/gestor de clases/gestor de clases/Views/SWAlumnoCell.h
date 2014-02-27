//
//  SWAlumnoCell.h
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 27/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWAlumnoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *ciudadLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
