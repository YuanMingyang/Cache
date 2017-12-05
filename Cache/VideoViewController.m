//
//  VideoViewController.m
//  Cache
//
//  Created by Yang on 2017/12/4.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlStr];
    self.player = [AVPlayer playerWithURL:url];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.videoView.bounds;
    [self.videoView.layer addSublayer:self.playerLayer];
    [self.player play];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.player pause];
    self.player = nil;
    [self.playerLayer removeFromSuperlayer];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
