//
//  VideoModel.h
//  Cache
//
//  Created by Yang on 2017/12/4.
//  Copyright © 2017年 A589. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *urlStr;

-(instancetype)initWithTitle:(NSString *)title urlStr:(NSString *)urlStr;
@end
