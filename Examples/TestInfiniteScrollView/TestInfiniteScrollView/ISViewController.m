//
//  ISViewController.m
//  TestInfiniteScrollView
//
//  Copyright (c) 2013 Zhang Zonghui
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
