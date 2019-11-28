//
//  SharesListVC.m
//  UGOCMagicbox
//
//  Created by admin on 2019/11/24.
//  Copyright © 2019 UG. All rights reserved.
//

#import "SharesListVC.h"

#import "PersentViewController.h"
#import "SharesAddView.h"
#import "SharesViewController.h"
#import "NetWorkRequest+Shares.h"
#import "SharesHistoryData.h"
#import "SharesViewController.h"
#import "SharesTargetListVC.h"

@interface SharesListVC ()
@property(strong, nonatomic) SharesAddView*sharesAddView;
@property(strong, nonatomic) PersentViewController *persent;
@property(strong, nonatomic) RLMResults<SharesHistoryData *> *datalist; //历史测评记录
@property(strong, nonatomic) BlockTableView *blockTableView;
@end

@implementation SharesListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updataData];
}
-(void)updataData{
    RLMResults *temresult= [SharesHistoryData allObjects];
    _datalist = [temresult sortedResultsUsingKeyPath:@"edittime" ascending:YES];
    [_blockTableView reloadData];
}



-(void)configUI{
     UG_WEAKSELF
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    //导航拦
    UIButton *itemButtom0 = [UIButton  new];
    [itemButtom0 setFrame:CGRectMake(0, 0, 30, 40)];
    NSString *bcaktitle = [NSString fontAwesomeIconStringForEnum:FAFlask];
    [itemButtom0.titleLabel setFont:FONT_FA20];
    [itemButtom0 setTitle:bcaktitle forState:UIControlStateNormal];
    [itemButtom0 ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        
        [self.navigationController pushViewController:[SharesTargetListVC new] animated:YES];
    }];
    UIBarButtonItem *button0 = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom0];
    
    UIButton *itemButtom = [UIButton  buttonWithType:UIButtonTypeContactAdd];
    [itemButtom setFrame:CGRectMake(0, 0, 30, 40)];
    [itemButtom ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
        
        self.persent = [PersentViewController new];
        weakSelf.persent.cotentView = self.sharesAddView;
        [weakSelf presentViewController:weakSelf.persent animated:YES completion:nil];
    }];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithCustomView:itemButtom];
    

    [self.navigationItem setRightBarButtonItems:@[button0,button]];
   
    self.blockTableView = [BlockTableView new];
    [self.view addSubview:_blockTableView];
    
    _blockTableView.numberOfRowsInSection = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return weakSelf.datalist.count;
    };
    _blockTableView.cellForRowAtIndexPath = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                          reuseIdentifier: @"cellid"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        SharesHistoryData *data = [weakSelf.datalist objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@:%zd",data.name, data.number,data.date];
        return cell;
    };
    _blockTableView.heightForRowAtIndexPath = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 44;
    };
    _blockTableView.didSelectRowAtIndexPath = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        SharesHistoryData *data = [weakSelf.datalist objectAtIndex:indexPath.row];
        NSData *filedata = [[NSFileManager defaultManager] contentsAtPath:data.absfilePath];
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:filedata options:NSJSONReadingMutableLeaves error:nil];
    
        SharesViewController *sharesViewController = [SharesViewController new];
        sharesViewController.sharesdata = data;
        sharesViewController.editDic = dic;
        [weakSelf.navigationController pushViewController:sharesViewController animated:YES];
        
    };
    
    
}

/**
 添加测评股票
 */
-(SharesAddView *)sharesAddView{
    if (!_sharesAddView) {
        _sharesAddView = [SharesAddView new];
        UG_WEAKSELF
        [_sharesAddView.commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
            weakSelf.sharesAddView.titleTF.titlaLabel.textColor = COLOR23;
            weakSelf.sharesAddView.numberTF.titlaLabel.textColor = COLOR23;
            weakSelf.sharesAddView.timeTF.titlaLabel.textColor = COLOR23;
            SharesSimpleData *data = weakSelf.sharesAddView.data;
            if (data.name.length==0) {
                weakSelf.sharesAddView.titleTF.titlaLabel.textColor = COLORDANGER;
                return ;
            }
            if (data.number.length==0) {
                weakSelf.sharesAddView.numberTF.titlaLabel.textColor = COLORDANGER;
                return ;
            }
            if (data.date==0) {
                weakSelf.sharesAddView.timeTF.titlaLabel.textColor = COLORDANGER;
                return ;
            }
            [weakSelf.persent dismissViewControllerAnimated:YES completion:nil];
            SharesViewController *sharesViewController = [SharesViewController new];
            sharesViewController.sharesdata = data;
            [self.navigationController pushViewController:sharesViewController animated:YES];
        }];
    }
    return _sharesAddView;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [_blockTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}


@end
