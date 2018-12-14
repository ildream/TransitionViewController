//
//  AYMoveOneVC.m
//  TransitionVCDemo
//
//  Created by anya on 2018/12/13.
//  Copyright © 2018 anya. All rights reserved.
//

#import "AYMoveOneVC.h"
#import "AYBeautifulImageCell.h"
#import "AYMoveTwoVC.h"

static NSString * const reuseIdentifier = @"Cell";

@interface AYMoveOneVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, copy) NSArray *imgsList;
@end

@implementation AYMoveOneVC

- (void)initialize
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 180);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView = [[UICollectionView alloc] initWithFrame:UIScreen.mainScreen.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self initialize];
   
    self.title = @"谁最美";
    _imgsList = @[@"g1",@"g2",@"g3",@"g4",@"g5"];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"AYBeautifulImageCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToRoot)];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)backToRoot
{
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AYBeautifulImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:_imgsList[indexPath.row % 5]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _clickIndexPath = indexPath;
    AYMoveTwoVC *vc = [[AYMoveTwoVC alloc] init];
    //设置导航控制器的代理为推出的控制器，可以达到自定义不同控制器的退出效果的目的
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
