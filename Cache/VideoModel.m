//
//  VideoModel.m
//  Cache
//
//  Created by Yang on 2017/12/4.
//  Copyright © 2017年 A589. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
-(instancetype)initWithTitle:(NSString *)title urlStr:(NSString *)urlStr{
    if (self = [super init]) {
        self.title = title;
        self.urlStr = urlStr;
    }
    return self;
}
@end
