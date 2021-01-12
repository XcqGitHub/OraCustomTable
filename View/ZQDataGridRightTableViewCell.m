//
//  ZQDataGridRightTableViewCell.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridRightTableViewCell.h"

@interface ZQDataGridRightTableViewCell ()
@property (nonatomic, strong) ZQDataGridRowViewCollectionView *cellView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UIView *titleHeadView;
@end

@implementation ZQDataGridRightTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    _cellView.frame = CGRectMake(0, 0, self.width, self.height - self.dataModel.titleViewHead);
    self.titleHeadView.frame = CGRectMake(0, 0, self.width, self.dataModel.titleViewHead);

}

- (void)setDataModel:(ZQDataGridRightTableViewCellModel *)dataModel{
    _dataModel = dataModel;
    if (_dataModel.titleViewHead > 0) {
        [self.contentView addSubview:self.titleHeadView];
    } else {
        self.titleHeadView.removeFromSuperview;
    }
    [self.contentView addSubview:self.cellView];
    self.cellView.dataModel = dataModel;
}

- (UIView *)titleHeadView {
    if (!_titleHeadView) {
        _titleHeadView = UIView.new;
        _titleHeadView.backgroundColor = UIColor.redColor;
//        UILabel *lb = UILabel.new
//        lb.textColor = UIColor.blackColor
//        // ○ ●
//        lb.text = "●"
        
     }
    return _titleHeadView;
}

- (ZQDataGridRowViewCollectionView *)cellView{
    if (!_cellView) {
        _cellView = [[ZQDataGridRowViewCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        Weak(self);
        _cellView.itemClick = ^(NSInteger row, NSInteger column,UIView * _Nullable tagetView) {
            if (weakself.itemClick) {
                weakself.itemClick(row, column,tagetView);
            }
        };
    }
    return _cellView;
}
@end
