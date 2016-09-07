//
//  NewsCollectionContainer.h
//  Life
//
//  Created by 徐攀 on 16/9/6.
//  Copyright © 2016年 iDustpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCollectionContainer : UICollectionViewController

@property (nonatomic, assign) NSInteger cellCount;

- (void)refreshNewsWithTitle:(NSString *)title selectedItem:(NSInteger)index;

@end
