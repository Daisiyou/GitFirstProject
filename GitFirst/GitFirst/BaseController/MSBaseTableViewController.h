//
//  SABaseTableViewController.h
//  SuperAssistant
//
//  Created by 飞光普 on 15/4/27.
//  Copyright (c) 2015年 飞光普. All rights reserved.
//

#import "MSRefreshViewController.h"

@interface MSBaseTableViewController : MSRefreshViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, retain)UITableView* tableView;

@end
