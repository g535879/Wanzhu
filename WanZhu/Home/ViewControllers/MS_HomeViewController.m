//
//  MS_HomeViewController.m
//  WanZhu
//
//  Created by 古玉彬 on 16/6/27.
//  Copyright © 2016年 ms. All rights reserved.
//

#import "MS_HomeViewController.h"
#import "MS_HomeHeaderView.h"
#import <MJRefresh.h>
#import <Masonry.h>


@interface MS_HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

/**
 *  顶部view
 */
@property (nonatomic, strong) UIView * homeHeaderView;

/**
 *  主collectionView
 */
@property (nonatomic, strong) UICollectionView * homeMainCollectionView;



@end

@implementation MS_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configSubviews];
    
    [self configLayout];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _homeMainCollectionView.contentInset = UIEdgeInsetsMake(self.homeHeaderView.height,0,0,0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Collectionview delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section) {
        return 1;
    }
    
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
//    UICollectionViewCell * cell = [[UICollectionViewCell alloc] initWithFrame:CGRectZero];
    cell.backgroundColor = [UIColor orangeColor];
    
    
    return cell;
}

//- (UICollectionReusableView * )collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    UICollectionReusableView * cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeaderId" forIndexPath:indexPath];
//    
//    cell.backgroundColor = [UIColor greenColor];
//    return cell;
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(MSScreenW / 2.0f - 10, MSScreenW / 2.0f - 10);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(MSScreenW, 50);
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}



#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    CGFloat offsetX = scrollView.contentOffset.y;
    
    CGFloat topViewHeight = self.homeHeaderView.height;
    
    CGFloat currentOffsetX = 0;
    
    if (offsetX >= -topViewHeight) {
        
        
        currentOffsetX = -offsetX - topViewHeight;
        
    }

    
    [self.homeHeaderView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(currentOffsetX);
    }];
    
    [self.view layoutIfNeeded];
    

}

#pragma mark - private method
- (void)configSubviews {
    
    
    
    
    
    
    [self.homeMainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册头
    
//    [self.homeMainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeaderId"];
    
    [self.view addSubview:self.homeMainCollectionView];
    [self.view addSubview:self.homeHeaderView];
}


- (void)configLayout {
    
    
    self.view.backgroundColor = MSHexColor(@"F8F8F8");
    
    
    [self.homeHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        
        make.height.mas_equalTo(_homeHeaderView.mas_width).multipliedBy(108/187.5f);
    }];
    
    [self.homeMainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //MSScreenW * 108 / 187.5f
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);

        
    }];
    
    
    
    UIImageView * bgImageView = [UIImageView new];
    bgImageView.image = [UIImage imageNamed:@"guid4.jpg"];
    [self.homeHeaderView addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.homeHeaderView);
    }];
}

#pragma mark - action events


#pragma mark - getter and setter

- (UICollectionView *)homeMainCollectionView {
    
    if (!_homeMainCollectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _homeMainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _homeMainCollectionView.delegate = self;
        _homeMainCollectionView.dataSource = self;
        _homeMainCollectionView.clipsToBounds = NO;
        _homeMainCollectionView.backgroundColor = MSHexColor(@"F8F8F8");
        _homeMainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            sleep(1);
            [_homeMainCollectionView.mj_header endRefreshing];
        }];
    }
    
    return _homeMainCollectionView;
}


- (UIView *)homeHeaderView {
    
    if (!_homeHeaderView) {
        _homeHeaderView = [UIView new];
        
        _homeHeaderView.backgroundColor = [UIColor greenColor];
        
    }
    return _homeHeaderView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
