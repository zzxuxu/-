//
//  BDJEssenceModel.m
//  百思不得姐
//
//  Created by 王健旭 on 2016/11/22.
//  Copyright © 2016年 王健旭. All rights reserved.
//

#import "BDJEssenceModel.h"

@implementation BDJEssenceModel

@end


@implementation BDJEssenceInfo

@end


@implementation BDJEssenceDetail

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"detailId":@"id"}];
}

@end


@implementation BDJEssenceTag

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"tagId":@"id"}];
}

@end


@implementation BDJEssenceComment

+ (JSONKeyMapper *)keyMapper {
    return[[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"commentId":@"id"}];
}

@end


@implementation BDJEssenceUser

@end


@implementation BDJEssenceVideo

@end


@implementation BDJEssenceImage

@end


@implementation BDJEssenceAudio

@end

