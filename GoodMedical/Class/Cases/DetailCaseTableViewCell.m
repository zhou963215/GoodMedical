//
//  DetailCaseTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//
#define image_H ([UIScreen mainScreen].bounds.size.width - 20)/6

#import "DetailCaseTableViewCell.h"
#import "YYPhotoBrowseView.h"
@interface CasesImageView ()
@property (nonatomic, strong) NSArray *dataSource;//数据源

@property (nonatomic, strong) NSMutableArray *imageViews;

@end

@implementation CasesImageView


- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
//                self.dataSource = @[@"http://picture.youth.cn/dmzb/201305/W020130514542662922703.jpg",
//                                    @"http://img5q.duitang.com/uploads/item/201504/15/20150415H5703_nusHC.jpeg",
//                                    @"http://img4q.duitang.com/uploads/item/201505/01/20150501192519_xLEac.thumb.700_0.jpeg",
//                                    @"http://img5.duitang.com/uploads/item/201503/05/20150305192547_Tewcf.jpeg",
//                                    @"http://img5q.duitang.com/uploads/item/201407/31/20140731202921_Qudzv.thumb.700_0.png",
//                                    @"http://2t.5068.com/uploads/allimg/150328/1033006409-5.png",
//                                    @"http://im5.tongbu.com/wallpaper/20120606/013becf7-0.jpg.488_488.jpg",
//                                    @"http://cdn.duitang.com/uploads/item/201211/24/20121124074205_5LPfy.jpeg",
//                                    @"http://b.hiphotos.baidu.com/zhidao/pic/item/91529822720e0cf32e663d440b46f21fbf09aaf8.jpg"];
        //
                [self creatImageViews];
        
    }
    
    return self;
}

- (void)setDataSource:(NSArray *)dataSource{
    
    _dataSource = dataSource;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self creatImageViews];
    
    
}

- (void)creatImageViews{
    
    for (int i =0; i < _dataSource.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:[self rectAtIndex:i]];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGes:)];
        //        imgView.backgroundColor = [UIColor redColor];
        [imgView addGestureRecognizer:tap];
        imgView.tag = i;
//        FoundFeedImagesModel * model = _dataSource[i];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PHOTO_BEFORE,model.path]];
        NSURL * url = [NSURL URLWithString:_dataSource[i]];
        [imgView setImageWithURL:url options:YYWebImageOptionShowNetworkActivity];
        
        [self addSubview:imgView];
        [self.imageViews addObject:imgView];
    }
    
}

-(CGRect)rectAtIndex:(NSInteger)index{
    //    KcolNumber 每行的个数
    //    Kwidth     控件的宽
    NSInteger KcolNumber = 6;
    CGFloat margin = 5;
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 104)/(KcolNumber);
    
    CGFloat height = width;
    
    NSUInteger rowIndex = 0;
    NSUInteger colIndex = 0;
    rowIndex = index /KcolNumber;
    colIndex = index %KcolNumber;
    X = colIndex * width + (colIndex)*margin + 10;
    Y = rowIndex * width + (rowIndex)*margin + 10;
    return CGRectMake(X, Y, width, height);
}

- (void)handleTapGes:(UITapGestureRecognizer *)tap{
    
    NSInteger selectIndex = [(UIImageView *)tap.view tag];
    
    NSLog(@"点击了%ld",selectIndex);
    
    NSMutableArray *items = [NSMutableArray array];
    
    UIView *fromView = nil;
    
    for (int i =0; i < _dataSource.count; i++) {
        
        YYPhotoGroupItem *item = [YYPhotoGroupItem new];
        
        item.thumbView = self.imageViews[i];
//        FoundFeedImagesModel * model = _dataSource[i];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",PHOTO_BEFORE,model.path]];
        NSURL *url = [NSURL URLWithString:_dataSource[i]];
        
        item.largeImageURL = url;
        [items addObject:item];
        if (i == selectIndex) {
            fromView =  self.imageViews[i];
        }
    }
    
    YYPhotoBrowseView *groupView = [[YYPhotoBrowseView alloc]initWithGroupItems:items];
    [groupView presentFromImageView:fromView toContainer:WINDOW animated:YES completion:nil];
    
}

- (NSMutableArray *)imageViews{
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
    }
    return _imageViews;
    
}


@end


#pragma Conent


@interface CasesCoentView ()

@property (nonatomic, strong) UIImageView * prefixImage;
@property (nonatomic, strong) UILabel * titleLB;
@property (nonatomic, strong) UILabel * descriptionLB;

@end


@implementation CasesCoentView


- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        [self setSubviews];
    }
    
    
    return self;
}

- (void)setSubviews{
    
    _prefixImage = [UIImageView new];
    _prefixImage.backgroundColor = [UIColor orangeColor];
    [self addSubview:_prefixImage];
    
    _titleLB = [UILabel new];
    _titleLB.font = [UIFont systemFontOfSize:14];
    _titleLB.text = @"医生记录";
    _titleLB.textColor = UICOLORRGB(0x888888);
    [self addSubview:_titleLB];
    
    _descriptionLB = [UILabel new];
    _descriptionLB.font = [UIFont systemFontOfSize:12];
    _descriptionLB.textColor = UICOLORRGB(0x888888);
//    _descriptionLB.text = @"我的志愿是做一个工程师,每天会做很多工程,下班后,我倒超级超市,买一大瓶可乐,一包卤水蛋,还有一包火腿,因为,减价啊!\n我的志愿是做一个消防队长,每天,我会扑灭很多火,下班后,我和我的队员小强,小明,芙蓉姐他们一起吃个套餐,有虾有鱼,还有可以选择冬瓜蛊代替例汤,可是要加三十元.";
    _descriptionLB.numberOfLines = 0;
    [self addSubview:_descriptionLB];
    
    
    WEAKSELF(wk);
    
    [_prefixImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(wk);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk.prefixImage.mas_right).offset(2);
        make.centerY.equalTo(wk.prefixImage);
    }];
    [_descriptionLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo (wk.prefixImage.mas_bottom).offset(10);
        make.left.equalTo(wk.prefixImage);
        make.right.equalTo(wk).offset(-10);
        make.bottom.equalTo(wk);
        
    }];
    
    
    
}



@end






@interface DetailCaseTableViewCell ()

@property (nonatomic, strong) UILabel * timeLB;
@property (nonatomic, strong) UILabel * typeLB;
@property (nonatomic, strong) UIView * leftLineView;
@property (nonatomic, strong) CasesImageView * casesImage;
@property (nonatomic, strong) CasesCoentView * coentView;

@property (nonatomic, strong) UILabel * nonmalLB;
@end


@implementation DetailCaseTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setSubviews];
    }
    
    
    return self;
}




- (void)setSubviews{
    
    _timeLB = [UILabel new];
    _timeLB.font = [UIFont systemFontOfSize:14];
    _timeLB.text = @"2017-08-09";
    _timeLB.textColor = UICOLORRGB(0x777777);
    [self addSubview:_timeLB];
    
    _typeLB = [UILabel new];
    _typeLB.font = [UIFont systemFontOfSize:14];
    _typeLB.text = @"入院";
    _typeLB.textColor = UICOLORRGB(0x8888888);
    [self addSubview:_typeLB];
    
    _leftLineView = [UIView new];
    _leftLineView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_leftLineView];
    
    _nonmalLB = [UILabel new];
    _nonmalLB.text = @"暂无照片";
    _nonmalLB.textColor = UICOLORRGB(0x777777);
    _nonmalLB.font = [UIFont systemFontOfSize:14];
    [self addSubview:_nonmalLB];
    
    _coentView =[CasesCoentView new];
    [self addSubview:_coentView];
    
    
    WEAKSELF(wk);
    
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(wk).offset(10);
        
    }];
    
    [_typeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk.timeLB.mas_right).offset(30);
        make.top.equalTo(wk.timeLB);
    }];
    
    [_leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk).offset(20);
        make.width.mas_equalTo(@4);
        make.top.equalTo(wk.timeLB.mas_bottom).offset(20);
        make.bottom.equalTo(wk.coentView.mas_bottom);
    }];
    
    [_nonmalLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(wk.leftLineView.mas_right).offset(20);
        make.top.equalTo(wk.leftLineView.mas_top).offset(20);
        
    }];
    
    [_coentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wk.nonmalLB.mas_bottom).offset(10);
        make.left.equalTo(wk.leftLineView.mas_right).offset(20);
        make.right.equalTo(wk);
        make.bottom.equalTo(wk.coentView.descriptionLB.mas_bottom);
        
    }];
    
    
}

- (void)upDataWithModel:(DetailCaseFrame *)frame{
    
    WEAKSELF(wk);
    
    if (_casesImage) {
        
        [_casesImage removeFromSuperview];
        
    }
    
    CasesDetailModel * model = frame.model;
    self.timeLB.text = model.time;
    self.typeLB.text = model.type;
    self.coentView.descriptionLB.text = model.detailText;
       if (model.imageArray.count>0) {
        
        _nonmalLB.hidden = YES;
        
        _casesImage = [CasesImageView new];
        [self addSubview:_casesImage];
        
        float h = (model.imageArray.count/6) * image_H + image_H;
        [_casesImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(wk.leftLineView.mas_right).offset(20);
            make.top.equalTo(wk.leftLineView.mas_top).offset(20);
            make.height.mas_equalTo(h);
            make.right.equalTo(wk);
            
        }];
        
        [_coentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(wk.casesImage.mas_bottom).offset(10);
            make.left.equalTo(wk.leftLineView.mas_right).offset(20);
            make.right.equalTo(wk);
            make.bottom.equalTo(wk.coentView.descriptionLB.mas_bottom);
            
        }];
           self.casesImage.dataSource = model.imageArray;
 
        
    }else{
        
        _nonmalLB.hidden = NO;
        [_nonmalLB mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(wk.leftLineView.mas_right).offset(20);
            make.top.equalTo(wk.leftLineView.mas_top).offset(20);
            
        }];
        
        [_coentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(wk.nonmalLB.mas_bottom).offset(10);
            make.left.equalTo(wk.leftLineView.mas_right).offset(20);
            make.right.equalTo(wk);
            make.bottom.equalTo(wk.coentView.descriptionLB.mas_bottom);
            
        }];

        
    }
    
    
}



@end
