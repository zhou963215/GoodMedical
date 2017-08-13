//
//  PhotoTableViewCell.m
//  GoodMedical
//
//  Created by zhou on 2017/8/11.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "PhotoTableViewCell.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface PhotoTableViewCell ()<TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate>{
    
    BOOL _isSelectOriginalPhoto;//是否选择原图
    
    NSMutableArray *_selectedAssets;//
    CGFloat _itemWH;//缩略图宽 collectionView item 宽
    CGFloat _margin;//collectionView item  间距
    int numberInLine;//每行item个数
    NSInteger _assestNumber;
    BOOL _editPhoto;
    
    
}
@property (nonatomic, assign) int columnNumberTF;//选择图片页面每栏照片数
@property (nonatomic, assign) int maxCountTF;// 照片最大可选张数，设置为1即为单选模式

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PhotoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _selectedPhotos = [NSMutableArray array];
        _selectedAssets = [NSMutableArray array];
        
        self.columnNumberTF = 4;
        self.maxCountTF = 1000;
        [self configCollectionView];
        _assestNumber = 0;

        
    }
    
    
    return self;
}

- (void)configCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _margin = 10;
    numberInLine = 4;
    _itemWH = (self.tz_width - (numberInLine-1) * _margin - 20) / numberInLine;
    layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    layout.minimumInteritemSpacing = _margin;
    layout.minimumLineSpacing = _margin;
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.scrollEnabled = NO;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    
    WEAKSELF(wk);
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(wk);
        
        
    }];
    
}

- (void) setSelectedPhotos:(NSMutableArray *)selectedPhotos{
    
    _selectedPhotos = selectedPhotos;
    _editPhoto = YES;
    [self.collectionView reloadData];
    
    
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn.png"];
        cell.deleteBtn.hidden = YES;
    } else {
        
        PhotoModel * photo = _selectedPhotos[indexPath.row];
        
        if (photo.isHistory) {//存在的图片
           
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:photo.url]];
        }else{//新增
            
             cell.imageView.image = photo.image;
            
        }
        
      
//        cell.asset = _selectedAssets[indexPath.row];
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
#pragma mark - Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    
    
    
    PhotoModel * model = _selectedPhotos[sender.tag];
    
    if (model.isHistory) {
        
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        
    }else{

        NSInteger differences = _selectedPhotos.count- _selectedAssets.count;
       
        
        
        
            [_selectedAssets removeObjectAtIndex:sender.tag - differences ];
            [_selectedPhotos removeObjectAtIndex:sender.tag];
            
    }
    
    
    
    
  
    
    if (self.rowHeight) {
        
        self.rowHeight([self refreshRowHeightWithCount:_selectedPhotos.count]);
        
    }
#pragma mark ----------------------------------------这里做处理
    
    //    [oldNamesArr ]
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {
        
        
        [self pushImagePickerController];
        
    } else { // preview photos or video / 预览照片或者视频
        
    }
}


#pragma mark - TZImagePickerController

- (void)pushImagePickerController {
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1000 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    
    
    
    
#pragma mark - 四类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    
    if (self.maxCountTF > 1) {
        // 1.设置目前已经选中的图片数组
        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    imagePickerVc.navigationBar.barTintColor = [UIColor blackColor];
    
    //修改完成按钮颜色啊
    imagePickerVc.oKButtonTitleColorDisabled = UICOLORRGB(0x79cef4);//35ace1
    imagePickerVc.oKButtonTitleColorNormal = UICOLORRGB(0x35ace1);//79cef4
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo =NO;
    imagePickerVc.allowPickingImage = YES;
    ///原图
    imagePickerVc.allowPickingOriginalPhoto = YES;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = NO;
    
    imagePickerVc.showSelectBtn = NO;
    
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.下面已经实现代理方法
    //    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
    //
    //
    //    }];
    
    [self.navigationController presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([type isEqualToString:@"public.image"]) {
        
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        tzImagePickerVc.sortAscendingByModificationDate = NO;
        [tzImagePickerVc showProgressHUD];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image completion:^(NSError *error){
            if (error) {
                [tzImagePickerVc hideProgressHUD];
                NSLog(@"图片保存失败 %@",error);
            } else {
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES completion:^(TZAlbumModel *model) {
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        [tzImagePickerVc hideProgressHUD];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        
                        [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                        
                    }];
                }];
            }
        }];
    }
}
#pragma mark 拍照添加图片
- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
    
    PhotoModel * photo = [PhotoModel new];
    photo.image = image;
    photo.isHistory = NO;
    
    
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:photo];
    
    
#pragma mark ---------------------------------------- 这里做处理
    //    [self uploadAccessory];
    [_collectionView reloadData];
    if (self.rowHeight) {
        
        self.rowHeight([self refreshRowHeightWithCount:_selectedPhotos.count]);
        
    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - TZImagePickerControllerDelegate

/// User click cancel button
/// 用户点击了取消
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    
    NSLog(@"cancel");
}

#pragma mark - 图片选择页面完成了选择图片
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    
    
    
  
        
        for (PhotoModel * model in _selectedPhotos) {
            
            if (!model.isHistory) {
                
                [_selectedPhotos removeObject:model];
            }
            
        }
        
    for (UIImage * image in photos) {
        
        PhotoModel * photo = [PhotoModel new];
        photo.image = image;
        photo.isHistory = NO;
        [_selectedPhotos addObject:photo];
  
        
    }
    
    
    
//    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView reloadData];
    
    if (self.rowHeight) {
        
        self.rowHeight([self refreshRowHeightWithCount:_selectedPhotos.count]);
        
    }
    
    // 1.打印图片名字
#pragma mark ---------------------------------------- 这里做处理
    //    [self uploadAccessory];
    
}


- (CGFloat)refreshRowHeightWithCount:(NSInteger)count{
    
    NSInteger number = count/4;
    
    CGFloat h = number * 87.5 +87.5 ;
    
    
    return h;
    
}






@end