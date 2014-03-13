//
//  SWRecursosCollectionViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 07/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#import "SWResource.h"
#import "SWImageCell.h"
#import "SWWebCell.h"
#import "SWResourcesJsonService.h"
#import "SWRecursosCollectionViewController.h"

@interface SWRecursosCollectionViewController ()

@property (nonatomic, strong) NSArray *resources;

@end

@implementation SWRecursosCollectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [self loadData];
}

- (void)viewDidAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidAppear:animated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(loadData)
                                               name:kPostResourceNotification
                                             object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidDisappear:animated];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return [_resources count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  SWResource *res = [_resources objectAtIndex:indexPath.item];
  
  if ([res isPhoto]) {
    // cargamos la celda para las imagenes
    SWImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:res.photo_url]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
  } else {
    SWWebCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WebCell" forIndexPath:indexPath];
    
    [cell.titleLabel setText:res.name];
    [cell.descriptionLabel setText:res.description];
    
    return cell;
  }
}

#pragma mark - Navigation 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif

  
  if ([segue.identifier isEqualToString:@"web_detalle"]) {
    NSIndexPath *selected = self.collectionView.indexPathsForSelectedItems[0];
    SWResource *tmpRes = [_resources objectAtIndex:selected.item];
    
    [segue.destinationViewController performSelector:@selector(setResource:)
                                          withObject:tmpRes];
  }
}

#pragma mark - Privados
- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _resources = [[NSArray alloc] init];
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES andText:@"Cargando..."];

  SWResourcesJsonService *ws = [[SWResourcesJsonService alloc] init];
  [ws getResourcerForController:self];
}

- (void)setData:(NSArray *)unArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  _resources = nil;
  _resources = [[NSArray alloc] initWithArray:unArray];
  
  [self.collectionView reloadData];
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)loadFail {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"Problema al cargar al cargar la información"
                                                 delegate:nil
                                        cancelButtonTitle:@"Aceptar"
                                        otherButtonTitles:nil];
  [alert show];
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
@end
