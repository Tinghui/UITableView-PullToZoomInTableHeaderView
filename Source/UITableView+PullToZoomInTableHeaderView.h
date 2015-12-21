//
//  UITableView+PullToZoomInTableHeaderView.h
//  UITableView+PullToZoomInTableHeaderView
//
//  Created by ZhangTinghui on 15/12/21.
//  Copyright © 2015年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PullToZoomInTableHeaderView)

/*!
 *  Set table header view and enable pull to zoom in effect on it.
 *
 *  NOTE: Don't forget disable pull to zoom in in dealloc
 *
 *  @param tableHeaderView table header view
 *  @param pullToZoomIn    whether in enable pull to zoom in.
 */
- (void)setTableHeaderView:(UIView *)tableHeaderView pullToZoomInEnabled:(BOOL)pullToZoomIn;


@end
