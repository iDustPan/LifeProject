//
//  NewsCollectionContainer.h
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewsCollectionContainerDelegate;
@interface NewsCollectionContainer : UICollectionViewController

@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, weak) id<NewsCollectionContainerDelegate> changeDelegate;

- (instancetype)initWithTitleArray:(NSArray *)titleArr;
- (void)refreshNewsWithTitle:(NSString *)title selectedItem:(NSInteger)index;

@end

@protocol NewsCollectionContainerDelegate <NSObject>

- (void)collectionView:(UICollectionView *)collectionView moveToItemAtIndexPath:(NSIndexPath *)indexPath;

@end
