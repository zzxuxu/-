//
//  EssenceVideoCell.h
//  百思不得姐
//
//  Created by 王健旭 on 2016/11/22.
//  Copyright © 2016年 王健旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDJEssenceDetail;

@interface EssenceVideoCell : UITableViewCell

//数据
@property (nonatomic, strong)BDJEssenceDetail *detailModel;

//便利的创建cell的方法
+(EssenceVideoCell *)videoCellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withModel:(BDJEssenceDetail *)detailModel;

@end
