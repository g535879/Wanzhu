//
//  MS_GuideViewController.m
//  MS_Training
//
//  Created by 王金明 on 15/12/28.
//  Copyright © 2015年 窦津. All rights reserved.
//

#import "MS_GuideViewController.h"
#import "MS_LoginViewController.h"
#import <UIView+SDAutoLayout.h>



@interface MS_GuideViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation MS_GuideViewController

#pragma mark - life cycle (生命周期)
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self pageUI];
    [self addSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 取得偏移量
    CGPoint point = scrollView.contentOffset;
    // 根据滚动的位置来决定当前是第几页
    // 可以用round() C语言方法进行四舍五入操作
    NSInteger index = round(point.x / scrollView.frame.size.width);
    // 设置分页控制器的当前页面
    self.pageControl.currentPage = index;
}
#pragma mark - event response (事件响应)
// 立即进入按钮
- (void)enterClick {
    
    NSLog(@"进入首页");
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"guid"];
    
    MS_LoginViewController *vc = [[MS_LoginViewController alloc]init];
    
    [[[UIApplication sharedApplication].delegate window] setRootViewController:vc];
}

#pragma mark - private methods (私有方法)
- (void)addSubViews {
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}

- (void)pageUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *imageArr = @[[UIImage imageNamed:@"引导页1"],
                           [UIImage imageNamed:@"引导页2"],
                          [UIImage imageNamed:@"引导页3"]];
    
    for (int i = 0; i < imageArr.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * MSScreenW, 0, MSScreenW, MSScreenH)];
        imageView.image = imageArr[i];
        
        [self.scrollView addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        
        if (i == imageArr.count - 1) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            [btn setBackgroundImage:[UIImage imageNamed:@"750-立即体验"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:btn];
            btn.sd_layout.bottomSpaceToView(imageView, 60)
            .leftSpaceToView(imageView, MSScreenW / 2 - 65)
            .widthIs(130)
            .heightIs(28);
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(MSScreenW * imageArr.count, 0);
    self.pageControl.numberOfPages = imageArr.count;
}
#pragma mark - getters and setters (控件初始化 懒加载)

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    return _scrollView;
}

- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(MSScreenW / 2 - 25, MSScreenH - 30, 50, 20)];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

@end
