//
//  VideoPlayController.m
//  Cache
//
//  Created by Yang on 2017/12/4.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "VideoPlayController.h"

@interface VideoPlayController ()

@end

@implementation VideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.urlStr]];
    [self.player play];
}



- (void)dealloc{
    [self.player cancelPendingPrerolls];
    [self.player replaceCurrentItemWithPlayerItem:nil];
    self.player = nil;
}

@end
