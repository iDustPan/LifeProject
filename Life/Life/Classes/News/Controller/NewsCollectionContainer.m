//
//  NewsCollectionContainer.m
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import "NewsCollectionContainer.h"
#import "NewsCollectionCell.h"

@interface NewsCollectionContainer ()
@property (nonatomic, strong) NSString *key;
@end

@implementation NewsCollectionContainer

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 108 - 49);
    self = [super initWithCollectionViewLayout:flowLayout];
    
    if (!self ) {return nil;}
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[NewsCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)refreshNewsWithTitle:(NSString *)title selectedItem:(NSInteger)index
{
    _key = title.copy;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
    cell.title = _key;
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NewsCollectionCell *newsContainerCell = (NewsCollectionCell *)cell;
//    newsContainerCell.title = self.title;
//}




@end
