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

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSString *key;

@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@implementation NewsCollectionContainer

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithTitleArray:(NSArray *)titleArr
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 108 - 49);
    self = [super initWithCollectionViewLayout:flowLayout];
    
    if (!self ) {return nil;}
    _titleArr = titleArr;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
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
    return _titleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
    cell.title = [self covertHanziToPingyin:_titleArr[indexPath.item]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.collectionView.dragging) {
        return;
    }
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:CGPointMake(kScreenWidth * 0.5 + scrollView.contentOffset.x, kScreenHeight * 0.5)];
    
    if ([self indexPathHasChange:indexPath] ) {
        if (self.changeDelegate && [self.changeDelegate respondsToSelector:@selector(collectionView:moveToItemAtIndexPath:)]) {
            [self.changeDelegate collectionView:self.collectionView moveToItemAtIndexPath:indexPath];
        }
    }
}

- (BOOL)indexPathHasChange:(NSIndexPath *)indexPath
{
    if (_indexPath.item == indexPath.item) {
        return NO;
    }
    
    _indexPath = indexPath;
    return true;
}

- (NSString *)covertHanziToPingyin:(NSString *)hanzi
{
    if (kIsEqualToString(hanzi, @"社会")) {
        return @"shehui";
    }
    if (kIsEqualToString(hanzi, @"国内")) {
        return @"guonei";
    }
    if (kIsEqualToString(hanzi, @"国际")) {
        return @"guoji";
    }
    if (kIsEqualToString(hanzi, @"娱乐")) {
        return @"yule";
    }
    if (kIsEqualToString(hanzi, @"体育")) {
        return @"tiyu";
    }
    if (kIsEqualToString(hanzi, @"军事")) {
        return @"junshi";
    }
    if (kIsEqualToString(hanzi, @"科技")) {
        return @"keji";
    }
    if (kIsEqualToString(hanzi, @"财经")) {
        return @"caijing";
    }
    if (kIsEqualToString(hanzi, @"时尚")) {
        return @"shishang";
    }
    
    return @"top";
}


@end
