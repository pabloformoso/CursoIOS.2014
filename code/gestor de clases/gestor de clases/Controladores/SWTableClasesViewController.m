//
//  SWTableClasesViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 06/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWClase.h"
#import "SWClaseCell.h"
#import "SWClasesJsonService.h"
#import "SWTableClasesViewController.h"

@interface SWTableClasesViewController ()

@property (nonatomic, strong) NSArray *clases;

@end

@implementation SWTableClasesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.clearsSelectionOnViewWillAppear = NO;
  
  _clases = [[NSArray alloc] init];
  
  [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_clases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *CellIdentifier = @"ClasesCell";
    SWClaseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                        forIndexPath:indexPath];
    
    SWClase *tmp = [_clases objectAtIndex:indexPath.row];
  
    [cell.nombre setText:tmp.name];
    [cell.start setText:tmp.startsAt];
    [cell.end setText:tmp.endsAt];
  
    return cell;
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

#pragma mark - Private Methods
- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  SWClasesJsonService *ws = [[SWClasesJsonService alloc] init];
  [ws getClasesForController:self];
}

- (void)setData:(NSMutableArray *)unArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif

  _clases = [NSArray arrayWithArray:unArray];
  [self.tableView reloadData];
}

- (void)failData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d) Ha ocurrido un error", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"Problema al cargar al cargar la información"
                                                 delegate:nil
                                        cancelButtonTitle:@"Aceptar"
                                        otherButtonTitles:nil];
  [alert show];
}

@end
