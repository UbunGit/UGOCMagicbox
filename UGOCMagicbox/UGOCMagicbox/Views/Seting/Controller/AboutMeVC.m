//
//  AboutMeVC.m
//  UGOCMagicbox
//
//  Created by admin on 2019/7/1.
//  Copyright © 2019 UG. All rights reserved.
//

#import "AboutMeVC.h"
#import <TABKit/TABKit.h>
#import "TABAnimated.h"
#import <AVFoundation/AVFoundation.h>

#define imgWidth kHeight(100)

@interface AboutMeVC ()

@property (nonatomic,strong) UIView *mainView;
@property (nonatomic,strong) UIImageView *topImg;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *firstInfoLab;
@property (nonatomic,strong) UILabel *secondInfoLab;
@property (nonatomic,strong) UITextView *testtfview;
@property (nonatomic,strong) UIButton *commitBtn;

@end

@implementation AboutMeVC

- (void)viewDidLoad {
    self.title = @"关于我们";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
    self.mainView.tabAnimated = TABViewAnimated.new;
    self.mainView.tabAnimated.categoryBlock = ^(UIView * _Nonnull view) {
        view.animation(1).width(200);
        view.animation(2).width(220);
        view.animation(3).width(180);
    };

    [self.mainView tab_startAnimationWithDelayTime:2 completion:^{
        [self afterGetData];
        [self.mainView tab_endAnimationEaseOut];
    }];
}

- (void)dealloc {
    NSLog(@"==========  dealloc  ==========");
}

- (void)afterGetData {
    
    
    _topImg.image = [UIImage imageNamed:@"test.jpg"];
    _titleLab.text = @"您不会没有骨架过渡吧？";
    _firstInfoLab.text = @"快用TABAnimated，为您解决烦恼";
    _secondInfoLab.text = @"加群更好解决问题：304543771";
    [_commitBtn setTitle:@"立即使用" forState:UIControlStateNormal];
    
    _commitBtn.layer.borderColor = UIColor.redColor.CGColor;
    _commitBtn.layer.borderWidth = 1.0;
}

#pragma mark - Init Method

- (void)initUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mainView];
    
    [self.mainView addSubview:self.topImg];
    [self.mainView addSubview:self.titleLab];
    [self.mainView addSubview:self.firstInfoLab];
    [self.mainView addSubview:self.secondInfoLab];
    [self.mainView addSubview:self.commitBtn];
    [self.mainView addSubview:self.testtfview];
}

#pragma mark - Lazy Method

- (UIImageView *)topImg {
    if (!_topImg) {
        _topImg = [[UIImageView alloc] init];
        _topImg.frame = CGRectMake((kScreenWidth - imgWidth)/2.0, kNavigationHeight + kHeight(60), imgWidth, imgWidth);
        _topImg.layer.cornerRadius = imgWidth/2.0;
        _topImg.layer.masksToBounds = YES;
        _topImg.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _topImg;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, CGRectGetMaxY(self.topImg.frame)+kHeight(30), kScreenWidth, kHeight(30));
        _titleLab.font = kFont(20);
        _titleLab.textColor = UIColor.blackColor;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UILabel *)firstInfoLab {
    if (!_firstInfoLab) {
        _firstInfoLab = [[UILabel alloc] init];
        _firstInfoLab.frame = CGRectMake(0, CGRectGetMaxY(self.titleLab.frame)+kHeight(60), kScreenWidth, kHeight(20));
        _firstInfoLab.font = kFont(16);
        _firstInfoLab.textColor = UIColor.grayColor;
        _firstInfoLab.textAlignment = NSTextAlignmentCenter;
    }
    return _firstInfoLab;
}

- (UILabel *)secondInfoLab {
    if (!_secondInfoLab) {
        _secondInfoLab = [[UILabel alloc] init];
        _secondInfoLab.frame = CGRectMake(0, CGRectGetMaxY(self.firstInfoLab.frame)+kHeight(8), kScreenWidth, kHeight(20));
        _secondInfoLab.font = kFont(16);
        _secondInfoLab.textColor = UIColor.grayColor;
        _secondInfoLab.textAlignment = NSTextAlignmentCenter;
    }
    return _secondInfoLab;
}
static AVPlayer *player = nil;
-(AVPlayer *)getplayer{
    if (!player) {
        player = [[AVPlayer alloc] init];
        player.volume = 1.0; // 默认最大音量
    }
    return player;
}
- (UIButton *)commitBtn {
    if (!_commitBtn) {
        _commitBtn = [[UIButton alloc] init];
        _commitBtn.frame = CGRectMake(kWidth(28), CGRectGetMaxY(self.secondInfoLab.frame)+kHeight(80), kScreenWidth - kWidth(28)*2, 55);
        [_commitBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        _commitBtn.layer.cornerRadius = 5.0f;
        [_commitBtn.titleLabel setFont:kFont(16)];
        [_commitBtn ug_addEvents:UIControlEventTouchUpInside andBlock:^(id  _Nonnull sender) {
            
            NSURL *url0 = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"test.mp3" ofType:nil]];
            NSURL * url1  = [NSURL URLWithString:@"http://diangoucomment-1258058953.cos.ap-guangzhou.myqcloud.com/WishDate/30925441562912197264.mp3".ug_urlencodedString];
            NSURL * url2  = [NSURL URLWithString:@"http://diangoucomment-1258058953.cos.ap-guangzhou.myqcloud.com/WishDate/30925441562912197264.mp3"];
            NSURL * url3  = [NSURL URLWithString:@"http://diangoucomment-1258058953.cos.ap-guangzhou.myqcloud.com/WishDate/15607419948613092544.amr"];
            AVPlayerItem * songItem = [[AVPlayerItem alloc]initWithURL:url3];
            AVPlayer * templayer = [self getplayer];
            [templayer play];
            [templayer replaceCurrentItemWithPlayerItem:songItem];
            
        }];
    }
    return _commitBtn;
}
-(UITextView *)testtfview{
    if (!_testtfview) {
        _testtfview = [UITextView new];
        _testtfview.frame = CGRectMake(kWidth(28), CGRectGetMaxY(self.topImg.frame)-kHeight(80), kScreenWidth - kWidth(28)*2, 200);
        _testtfview.ug_maximumLimit = 10;
        _testtfview.ug_placeholderStr = @"我是谁？";
        _testtfview.ug_placeholderColor = UIColor.ug_random;
        _testtfview.ug_characterLengthPrompt = YES;
    }
    return _testtfview;
    
}


@end
