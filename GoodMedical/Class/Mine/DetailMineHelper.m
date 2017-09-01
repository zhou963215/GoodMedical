//
//  DetailMineHelper.m
//  GoodMedical
//
//  Created by zhou on 2017/8/23.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DetailMineHelper.h"
#import "InputTableViewCell.h"
#import "ZHPickerCell.h"
#import "HeaderTableViewCell.h"
@interface DetailMineHelper ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) HeaderTableViewCell * headerCell;
@property (nonatomic, strong) InputTableViewCell * nameCell;
@property (nonatomic, strong) InputTableViewCell * emailCell;
@property (nonatomic, strong) ZHPickerCell * sexCell;
@property (nonatomic, strong) InputTableViewCell * ageCell;

@property (nonatomic, strong) NSArray * rows;

@end

@implementation DetailMineHelper

+(instancetype)blog{
    
    return [[DetailMineHelper alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = UICOLORRGB(0xf5f5f5);
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.tableFooterView = [self creatBottomView];
        self.rows = @[self.headerCell,self.nameCell,self.emailCell,self.sexCell,self.ageCell];
        
        
        [_tableView scrollToTop];
        
    }
    
    return self;
    
    
}



- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    
    [self.tableView reloadData];
    
}





#pragma mark  tableview代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return _rows.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    return _rows[indexPath.row];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if (indexPath.row == 0) {
        
        [self callActionSheet];

    }
    
    
}

- (void)callActionSheet{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"上传头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self callImagePickerControllerWithIndex:0];
        
    }];
    UIAlertAction *phone = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self callImagePickerControllerWithIndex:1];
        
    }];
    UIAlertAction * cance = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    [alert addAction:cance];
    [alert addAction:confirmAction];
    [alert addAction:phone];
    [self.tableView.navigationController presentViewController:alert animated:YES completion:nil];
    
    
    
}

- (void)callImagePickerControllerWithIndex:(NSInteger)index{
    
    if (index==0&&![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        
        [ZHHud initWithMessage:@"请允许获取相册权限"];
        
        return;
        
    }
    
    if (index==1&&![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [ZHHud initWithMessage:@"请允许获取相机权限"];
        
        return;
        
    }
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = index;
    ipc.delegate = self;
    
    [self.tableView.navigationController presentViewController:ipc animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    
    NSLog(@"%@",info);
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    self.headerCell.header.image = image;
//    NSData * data = UIImageJPEGRepresentation(image, 0.1);
//    [[ZHNetWorking sharedZHNetWorking]UpWithPOST:UPLOADIMG parameters:@{} data:data UpFileType:@"image" success:^(id  _Nonnull responseObject) {
//        
//        NSLog(@"%@",responseObject);
//        
//        if ([responseObject[@"status"]isEqualToString:@"ok"]) {
//            
//            NSDictionary * dict = responseObject[@"data"];
//            NSArray * arr = dict[@"imglist"];
//            NSDictionary * data = arr[0];
//            
//            [self saveHeaderWithUrl:data[@"path"]];
//            
//        }
//        else{
//            
//            [ZHHud initWithMessage:@"上传失败"];
//            
//        }
//        
//    } failure:^(NSError * _Nonnull error) {
//        
//        
//    }];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

#pragma MARK====================懒加载

- (HeaderTableViewCell *)headerCell{
    
    if (!_headerCell) {
        
        _headerCell = [[HeaderTableViewCell alloc]init];
        _headerCell.nameLB.text = @"头像";
        
        
    }
    return _headerCell;
}


- (InputTableViewCell *)nameCell{
    
    if (!_nameCell) {
        _nameCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"姓名"];
    }
    
    return _nameCell;
}

- (InputTableViewCell *)emailCell{
    
    if (!_emailCell) {
        
        _emailCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"邮箱"];
    }
    
    return _emailCell;
}

- (ZHPickerCell *)sexCell{
    
    
    if (!_sexCell) {
        
        _sexCell = [[ZHPickerCell alloc]initWithRows:@[@"男",@"女"] rowValues:@[@"男",@"女"]];
        _sexCell.nameLB.text = @"性别";
        
        [_sexCell setTitle:@"男" withValue:@"男"];
        [_sexCell upWidthChange:YES];
        
        
    }
    
    
    return _sexCell;
}


- (InputTableViewCell *)ageCell{
    
    if (!_ageCell) {
        
        _ageCell = [[InputTableViewCell alloc]initWithValue:@"" tip:@"" title:@"年龄"];
    }
    return _ageCell;
}



- (UIView * )creatBottomView{
    
    UIView * backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5 ;
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextstep:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backgroundView.mas_bottom).offset(-10);
        make.centerX.equalTo(backgroundView);
        make.size.mas_equalTo(CGSizeMake(WIDTH*0.7, 40));
    }];
    
    
    
    return backgroundView;
}




- (void)nextstep:(UIButton *)sender{
    
    
    
    
    
}

@end
