//
//  SWTablaAlumnosViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 27/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWAlumno.h"
#import "SWAlumnoCell.h"
#import "SWDetalleAlumnoViewController.h"
#import "SWTablaAlumnosViewController.h"

@interface SWTablaAlumnosViewController ()

// Los objetos mutables son los que se pueden modificar después de instanciados.
@property(nonatomic, strong) NSMutableArray *alumnos;

@end

@implementation SWTablaAlumnosViewController

- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = YES;
  
  SWAlumno *al1 = [[SWAlumno alloc] initWithNombre:@"Pablo"
                                          apellido:@"Formoso"
                                           yCorreo:@"pablo@pabloformoso.com"];
  
  SWAlumno *al2 = [[SWAlumno alloc] initWithNombre:@"Paula"
                                          apellido:@"Perez"
                                           yCorreo:@"pperez@gmail.com"];
  
  _alumnos = [[NSMutableArray alloc] initWithArray:@[al1, al2]];
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  if (section == 0) {
    return [_alumnos count];
  } else {
    return 0;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SWAlumnoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
  SWAlumno *tmp = [_alumnos objectAtIndex:indexPath.row];
  
  [cell.nombreLabel setText:tmp.nombre];
  [cell.ciudadLabel setText:tmp.ciudad];
  [cell.emailLabel setText:tmp.email];
  
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  NSIndexPath *seleccionado = [self.tableView indexPathForSelectedRow];
  SWAlumno *tmp = [_alumnos objectAtIndex:seleccionado.row];
  
  if ([segue.identifier isEqualToString:@"ver_detalle"]) {
    SWDetalleAlumnoViewController *controladorDestino = [segue destinationViewController];
    [controladorDestino loadData:tmp];
    /* 
    Envío como si fuese un protocolo informal
    if ([controladorDestino respondsToSelector:@selector(loadData:)]) {
      [controladorDestino performSelector:@selector(loadData:) withObject:tmp];
    }
    */
    
  }
}

@end
