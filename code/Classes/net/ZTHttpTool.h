//
//  ZTHttpTool.h
//
//  Created by zhuangtao on 15/6/3.
//  Copyright (c) 2015年 zhuangtao. All rights reserved.
//
/**
 *  封装一个网络请求类，让整个项目不直接依赖于网络请求（AFN，ASI）框架，降低controller的耦合性
 */
#import <Foundation/Foundation.h>

@interface ZTHttpTool : NSObject
/**
 *  get
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后回调函数
 *  @param failure 请求失败后回调函数
 */
+ (void)getWithUrl:(NSString *)url param:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;

+ (void)postWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;
+ (void)postHaveBufferWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;
//提交对象，Json
+ (void)postObjectWithurl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;

+ (void)postWithImageUrl:(NSString *)url param:(id)params withImageArr:(NSArray *)imgArr success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;
//授权
+ (void)oauthInfoWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;

//+ (void)postWithUrl:(NSString *)url param:(id)params requestView:(UIView *)requestView success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure;
@end
