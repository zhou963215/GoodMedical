//
//  CasesAfterHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "CasesAfterHelper.h"
#import "ZHDateCell.h"
#import "ZHPickerCell.h"
#import "PhotoTableViewCell.h"
#import "SubjectTableViewCell.h"

#import "PhotoModel.h"
@interface CasesAfterHelper ()
{
    
    CGFloat _photoHeight;
    CGFloat _cellHeight;
}
@property (nonatomic, strong) ZHPickerCell * typePickCell;
@property (nonatomic, strong) ZHDateCell * timePickCell;
@property (nonatomic, strong) PhotoTableViewCell * photoCell;
@property (nonatomic, strong) SubjectTableViewCell * subjectCell;
@property (nonatomic, strong) NSArray * rows;



@end

@implementation CasesAfterHelper

+(instancetype)blog{
    
    return [[CasesAfterHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44;
       
        UIView  * view = [UIView new];
        self.tableView.tableFooterView = view;
        
        
        self.rows = @[@[self.typePickCell],@[self.timePickCell],@[self.photoCell],@[self.subjectCell]];
        
        _photoHeight = 87.5;
    }
    
    return self;
    
    
}

- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 2 || section ==3) {
        return 40;
    }
    return 0.1;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 2) {
        
        return  [self creatSectionHead:YES];
        
    }else if (section ==3){
        
        return  [self creatSectionHead:NO];
    }
    
    
    
    
    
    return nil;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _rows.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 || indexPath.section ==1 ) {
        
        return UITableViewAutomaticDimension;
    }else if (indexPath.section ==2){
        return _photoHeight;
  
    }
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 1;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return _rows[indexPath.section][indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

- (ZHPickerCell *)typePickCell{
    
    if (!_typePickCell) {
        
        _typePickCell = [[ZHPickerCell alloc]initWithRows:@[@"入院",@"出院",@"手术",@"病历",@"检查",@"检验",@"首诊",@"复诊",@"处方",@"其他"] rowValues:@[@"入院",@"出院",@"手术",@"病历",@"检查",@"检验",@"首诊",@"复诊",@"处方",@"其他"]];
        _typePickCell.nameLB.text = @"名称";
        [_typePickCell setTitle:@"入院" withValue:@"入院"];
        
//        [_typePickCell setPlaceholder:@"请选择性别"];
        [_typePickCell upWidthChange:YES];    }
    
    return _typePickCell;
}

- (ZHDateCell *)timePickCell{
    
    if (!_timePickCell) {
        
        
        _timePickCell = [[ZHDateCell alloc]init];
        _timePickCell.nameLB.text = @"日期";
        _timePickCell.disabled = NO;
//        [_timePickCell setPlaceholder:@"请选择日期"];
        [_timePickCell setTitle:[PublicTools defaultDate] withValue:nil];
        _timePickCell.showDate = YES;
        _timePickCell.dateFormat = @"yyyy-MM-dd";
        [_timePickCell upWidthChange:YES];
        
    }
    
    
    return _timePickCell;
}

- (PhotoTableViewCell *)photoCell{
    
    if (!_photoCell) {
        
        _photoCell = [[PhotoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"photo"];
        
        
        PhotoModel * model = [PhotoModel new];
        model.isHistory = YES;
        model.url = @"http://picture.youth.cn/dmzb/201305/W020130514542662922703.jpg";
//        NSArray * arr = @[model];
        
        NSMutableArray * array = [NSMutableArray arrayWithObject:model];
        
        _photoCell.selectedPhotos = array;
        
        
        WEAKSELF(wk);
        _photoCell.rowHeight = ^(CGFloat rowH){
          
            _photoHeight = rowH;
            [wk.tableView reloadData];
            
        };
        
        
    }
    
    
    return _photoCell;
}

- (SubjectTableViewCell *)subjectCell{
    
    if (!_subjectCell) {
        
        
        _subjectCell = [[SubjectTableViewCell alloc]initWithTitle:@"" subject:@"请输入记录描述" height:80];

    }
    return _subjectCell;
}

- (NSDictionary *)casesData{
    
    
    _casesData = @{@"type": _typePickCell.pickValue,@"date" : _timePickCell.dateString,@"photo":_photoCell.submitPhotos,@"text":_subjectCell.value};
    
    
    return _casesData;
}

- (UIView *)creatSectionHead:(BOOL)isHead{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    view.backgroundColor = UICOLORRGB(0xf5f5f5);

    
    UILabel * nameLB= [UILabel new];
    nameLB.font = [UIFont systemFontOfSize:14];
    nameLB.textColor = [UIColor blackColor];
    nameLB.text = isHead? @"上传照片" : @"医生记录";
    [view addSubview:nameLB];
    
    //    WEAKSELF(wk)
    
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view);
        make.left.equalTo(view).offset(10);
        
    }];
    
    return view;
    
    
}




@end
