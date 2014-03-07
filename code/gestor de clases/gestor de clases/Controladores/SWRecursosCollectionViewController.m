//
//  SWRecursosCollectionViewController.m
//  gestor de clases
//
//  Created by Pablo Formoso Estada on 07/03/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import "SWResource.h"
#import "SWResourcesJsonService.h"
#import "SWRecursosCollectionViewController.h"

@interface SWRecursosCollectionViewController ()

@end

@implementation SWRecursosCollectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 0; // tamaño del array de recursos
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  return nil;
}

#pragma mark - Navigation 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
}

#pragma mark - Privados
- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES andText:@"Cargando..."];

  SWResourcesJsonService *ws = [[SWResourcesJsonService alloc] init];
  [ws getResourcerForController:self];
}

- (void)setData:(NSArray *)unArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  // implementación
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)loadFail {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
@end
