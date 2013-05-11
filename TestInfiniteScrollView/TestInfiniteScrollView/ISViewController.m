//
//  ISViewController.m
//  TestInfiniteScrollView
//
//  Created by Zhang Zonghui on 11/5/13.
//  Copyright (c) 2013 StudioIce. All rights reserved.
//

#import "ISViewController.h"
#import "ISPageScrollView.h"

@interface ISViewController () <ISPageScrollViewDataSource>

@end

@implementation ISViewController {
    __weak IBOutlet ISPageScrollView *_pageScrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && self.view.window == nil)
    {
        self.view = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _pageScrollView.dataSource = self;
    _pageScrollView.numberOfPages = 10;
    _pageScrollView.numberOfReusableViews = 5;
    
    [_pageScrollView displayPage:0];
}


#pragma mark - ISPageScrollViewDataSource
- (UIView *)viewForScrollView:(UIScrollView *)scrollView Page:(NSInteger)pageIndex
{
    UIView *pageView = [[UIView alloc] initWithFrame:scrollView.frame];
    pageView.backgroundColor = [UIColor colorWithRed:1 - pageIndex * 10 / 255.0 green:0.8 - pageIndex * 10 / 255.0 blue:0.3 + pageIndex * 10 / 255.0 alpha:1.0];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(scrollView.frame.size.width / 2.0 - 80.0f, scrollView.frame.size.height / 2.0 - 20.0f, 160.0f, 40.0f)];
    label.text = [NSString stringWithFormat:@"Page %d", pageIndex];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    [pageView addSubview:label];
    
    return pageView;
}

@end
