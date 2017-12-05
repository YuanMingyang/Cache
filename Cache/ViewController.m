//
//  ViewController.m
//  Cache
//
//  Created by Yang on 2017/12/4.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "ViewController.h"
#import "VideoModel.h"
#import <KTVHTTPCache/KTVHTTPCache.h>
#import "MediaPlayerViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *videoArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]);
    
    
    [self startServer];
    [self loadData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
-(void)startServer{
    NSError *error;
    [KTVHTTPCache proxyStart:&error];
    if (error) {
        NSLog(@"开启服务失败");
    }else{
        NSLog(@"开启服务成功");
    }
}
-(void)loadData{
    VideoModel *video1 = [[VideoModel alloc] initWithTitle:@"林俊杰-爱笑的眼睛" urlStr:@"http://aliuwmp3.changba.com/userdata/video/45F6BD5E445E4C029C33DC5901307461.mp4"];
    VideoModel *video2 = [[VideoModel alloc] initWithTitle:@"林俊杰-他说" urlStr:@"http://aliuwmp3.changba.com/userdata/video/3B1DDE764577E0529C33DC5901307461.mp4"];
    VideoModel *video3 = [[VideoModel alloc] initWithTitle:@"林俊杰-不潮不用花钱" urlStr:@"http://qiniuuwmp3.changba.com/941946870.mp4"];
    VideoModel *video4 = [[VideoModel alloc] initWithTitle:@"林俊杰-我还想她" urlStr:@"http://lzaiuw.changba.com/userdata/video/940071102.mp4"];
    self.videoArray = @[video1,video2,video3,video4];
}

#pragma mark -- UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videoArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    VideoModel *video = self.videoArray[indexPath.row];
    cell.textLabel.text = video.title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    VideoModel *vide0 = self.videoArray[indexPath.row];
    NSString *URLString = vide0.urlStr;
    
    if (URLString.length <= 0) {
        return;
    }
    
    NSString * proxyURLString = [KTVHTTPCache proxyURLStringWithOriginalURLString:URLString];
    
    MediaPlayerViewController * viewController = [[MediaPlayerViewController alloc] initWithURLString:proxyURLString];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
