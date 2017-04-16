//
//  ViewController.m
//  ScrawlView
//
//  Created by 同筑科技 on 2017/4/14.
//  Copyright © 2017年 well. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController ()
@property(nonatomic,strong)PaintView *paintView;
@property(nonatomic,strong)UIButton *clearButton;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIButton *saveButton;

@end

@implementation ViewController

-(PaintView *)paintView
{
    if (!_paintView) {
        _paintView = [[PaintView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
        _paintView.backgroundColor = [UIColor whiteColor];
    }
    return _paintView;
}
-(UIButton *)clearButton
{
    if (!_clearButton) {
        _clearButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width/3, 20)];
        [_clearButton setTitle:@"清除" forState:UIControlStateNormal];
        _clearButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_clearButton addTarget:self action:@selector(clearScrawl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}
-(UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, 70, self.view.frame.size.width/3, 20)];
        [_backButton setTitle:@"回退" forState:UIControlStateNormal];
        _backButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backScrawl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
-(UIButton *)saveButton
{
    if (!_saveButton) {
        _saveButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3*2, 70, self.view.frame.size.width/3, 20)];
        [_saveButton setTitle:@"截图" forState:UIControlStateNormal];
        _saveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_saveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(saveScrawl) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.clearButton];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.saveButton];
    [self.view addSubview:self.paintView];
}

-(void)clearScrawl
{
    [self.paintView clear];
}

-(void)backScrawl
{
    [self.paintView back];
}
-(void)saveScrawl
{
    UIImage *image = [self saveScrawlWithView:self.paintView];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:)  , nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"保存失败");
    }else
    {
        NSLog(@"保存成功");
    }
}

-(UIImage *)saveScrawlWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
    
}


@end
