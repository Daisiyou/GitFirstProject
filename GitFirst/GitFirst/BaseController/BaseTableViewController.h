//
//  SABaseTableViewController.h
//
//
//  Created by Daisiyou on 15/9/15.
//  Copyright (c) 2015年 Daisiyou. All rights reserved.
//

#import "RefreshViewController.h"

@interface BaseTableViewController : RefreshViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, retain)UITableView* tableView;

@end
