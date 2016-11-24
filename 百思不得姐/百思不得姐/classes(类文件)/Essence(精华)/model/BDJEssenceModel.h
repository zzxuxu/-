//
//  BDJEssenceModel.h
//  百思不得姐
//
//  Created by 王健旭 on 2016/11/22.
//  Copyright © 2016年 王健旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BDJEssenceInfo;
@class BDJEssenceUser;
@class BDJEssenceVideo;

@protocol BDJEssenceDetail;
@protocol BDJEssenceTag;
@protocol NSString;
@protocol BDJEssenceComment;


@interface BDJEssenceModel : JSONModel

@property (nonatomic, strong)BDJEssenceInfo<Optional> *info;

@property (nonatomic, strong)NSArray<Optional, BDJEssenceDetail> *list;

@end


@interface BDJEssenceInfo : JSONModel

@property (nonatomic, strong)NSNumber<Optional> *count;

@property (nonatomic, strong)NSNumber<Optional> *np;

@end


@interface BDJEssenceDetail : JSONModel

@property (nonatomic, copy)NSString<Optional> *bookmark;
@property (nonatomic, copy)NSString<Optional> *comment;
@property (nonatomic, strong)NSNumber<Optional> *down;

@property (nonatomic, strong)NSNumber<Optional> *forward;
@property (nonatomic, copy)NSString<Optional> *detailId;
@property (nonatomic, copy)NSString<Optional> *passtime;

@property (nonatomic, copy)NSString<Optional> *share_url;
@property (nonatomic, strong)NSNumber<Optional> *status;
@property (nonatomic, strong)NSArray<Optional, BDJEssenceTag> *tags;

@property (nonatomic, copy)NSString<Optional> *text;
@property (nonatomic, strong)NSArray<Optional, BDJEssenceComment> *top_comments;
@property (nonatomic, copy)NSString<Optional> *type;

@property (nonatomic, strong)BDJEssenceUser<Optional> *u;
@property (nonatomic, copy)NSString<Optional> *up;
@property (nonatomic, strong)BDJEssenceVideo<Optional> *video;

//
@property (nonatomic, strong)NSNumber<Optional> *cellHeight;

@end


@interface BDJEssenceTag : JSONModel

@property (nonatomic, strong)NSNumber<Optional> *tagId;
@property (nonatomic, copy)NSString<Optional> *name;

@end


@interface BDJEssenceComment : JSONModel

@property (nonatomic, copy)NSString<Optional> *cmt_type;
@property (nonatomic, copy)NSString<Optional> *content;
@property (nonatomic, strong)NSNumber<Optional> *CommentId;

@property (nonatomic, strong)NSNumber<Optional> *like_count;
@property (nonatomic, copy)NSString<Optional> *passtime;
@property (nonatomic, strong)NSNumber<Optional> *precid;

@property (nonatomic, strong)NSNumber<Optional> *preuid;
@property (nonatomic, strong)NSNumber<Optional> *status;
@property (nonatomic, strong)BDJEssenceUser<Optional> *u;

@property (nonatomic, strong)NSNumber<Optional> *voicetime;
@property (nonatomic, copy)NSString<Optional> *voiceuri;

@end


@interface BDJEssenceUser : JSONModel

@property (nonatomic, strong)NSArray<NSString, Optional> *header;
@property (nonatomic, strong)NSNumber<Optional> *is_vip;
@property (nonatomic, copy)NSString<Optional> *name;

@property (nonatomic, copy)NSString<Optional> *room_icon;
@property (nonatomic, copy)NSString<Optional> *room_name;
@property (nonatomic, copy)NSString<Optional> *room_role;

@property (nonatomic, copy)NSString<Optional> *room_url;
@property (nonatomic, copy)NSString<Optional> *sex;
@property (nonatomic, copy)NSString<Optional> *uid;

@end


@interface BDJEssenceVideo : JSONModel

@property (nonatomic, copy)NSArray<Optional, NSString> *download;
@property (nonatomic, strong)NSNumber<Optional> *duration;
@property (nonatomic, strong)NSNumber<Optional> *height;

@property (nonatomic, strong)NSNumber<Optional> *playcount;
@property (nonatomic, strong)NSNumber<Optional> *playfcount;
@property (nonatomic, copy)NSArray<Optional, NSString> *thumbnail;

@property (nonatomic, copy)NSArray<Optional, NSString> *thumbnail_small;
@property (nonatomic, copy)NSArray<Optional, NSString> *video;
@property (nonatomic, strong)NSNumber<Optional> *width;

@end





