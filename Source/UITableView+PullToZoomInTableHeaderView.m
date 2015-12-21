//
//  UITableView+PullToZoomInTableHeaderView.m
//  UITableView+PullToZoomInTableHeaderView
//
//  Created by ZhangTinghui on 15/12/21.
//  Copyright © 2015年 www.morefun.mobi. All rights reserved.
//

#import <objc/runtime.h>
#import "UITableView+PullToZoomInTableHeaderView.h"

@implementation UITableView (PullToZoomInTableHeaderView)

- (UIView *)mf_pullToZoomInHeaderView {
    return objc_getAssociatedObject(self, @selector(mf_pullToZoomInHeaderView));
}

- (void)mf_setPullToZoomInHeaderView:(UIView *)view {
    UIView *lastView = [self mf_pullToZoomInHeaderView];
    if (lastView == view) {
        return;
    }
    
    if (lastView != nil) {
        [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
    }
    
    objc_setAssociatedObject(self, @selector(mf_pullToZoomInHeaderView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (view != nil) {
        [self addObserver:self
               forKeyPath:NSStringFromSelector(@selector(contentOffset))
                  options:NSKeyValueObservingOptionNew
                  context:@selector(mf_pullToZoomInHeaderView)];
    }
}

- (void)setTableHeaderView:(UIView *)tableHeaderView pullToZoomInEnabled:(BOOL)pullToZoomIn {
    tableHeaderView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    if (!pullToZoomIn) {
        [self mf_setPullToZoomInHeaderView:nil];
        self.tableHeaderView = tableHeaderView;
    }
    else {
        [self mf_setPullToZoomInHeaderView:tableHeaderView];
        UIView *headerContainter = [[UIView alloc] initWithFrame:tableHeaderView.bounds];
        headerContainter.backgroundColor = [UIColor clearColor];
        [headerContainter addSubview:tableHeaderView];
        [headerContainter setClipsToBounds:NO];
        self.tableHeaderView = headerContainter;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    if (context == @selector(mf_pullToZoomInHeaderView)
        && [keyPath isEqualToString:NSStringFromSelector(@selector(contentOffset))]) {
        
        const CGFloat offsetY = [change[NSKeyValueChangeNewKey] CGPointValue].y;
        if (offsetY > 0) {
            return;
        }
        
        CGRect headerFrame = [self mf_pullToZoomInHeaderView].frame;
        headerFrame.origin.y = offsetY;
        headerFrame.size.width = CGRectGetWidth(self.tableHeaderView.bounds);
        headerFrame.size.height = CGRectGetHeight(self.tableHeaderView.bounds) + fabs(offsetY);
        [[self mf_pullToZoomInHeaderView] setFrame:headerFrame];
        [[self mf_pullToZoomInHeaderView] layoutIfNeeded];
    }
    else if ([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end


