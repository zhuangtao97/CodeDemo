//
//  ZTHttpTool.m
//  oneweibo
//
//  Created by zhuangtao on 15/6/3.
//  Copyright (c) 2015年 zhuangtao. All rights reserved.
//

#import "ZTHttpTool.h"
#import "AFNetworking.h"

@implementation ZTHttpTool
+ (void)getWithUrl:(NSString *)url param:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{


    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",@"",url];
    [mgr GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{



    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",@"",url];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStr]]];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:@"2" forHTTPHeaderField:@"platform"];
//AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *paramDict ;
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [mgr POST:urlStr parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            
            success(responseObject);
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//返回数据在本地的存储路径(文件名称进行md5加密处理)
//+(NSString *)pathWithFileName:(NSString *)fileName{
//    return [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",[fileName MD5Hash]];
//    
//}
//+ (void)postHaveBufferWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{
//    WDRequestParam *param = params;
//    NSString *path = [ZTHttpTool pathWithFileName:[NSString stringWithFormat:@"%@%@%@",param.action,param.data,[WDLoginModel sharedLoginModel].Mobile]];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path]&&[NSFileManager isTimeOutWithPath:path time:60*5]) {
//        success([NSDictionary dictionaryWithContentsOfFile:path]);
//        return;
//    }
//    param.vision = @"1.1.0";
//    param.sign = @"xxxxx";
//    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@%@%@",param.action,param.source,param.timestamp,param.data,param.vision];
//    param.sign = [self md5:md5Str];
//    url = @"http://192.168.1.121:85/api.do";
////    url = @"http://api.plusthree.cn/api.do";
//        url = @"http://interface.plusthree.cn/api.do";
//    
//
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    NSDictionary *paramDict = [param keyValues];
//    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    
//    [mgr POST:url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            NSString *path = [ZTHttpTool pathWithFileName:[NSString stringWithFormat:@"%@%@%@",param.action,param.data,[WDLoginModel sharedLoginModel].Mobile]];
//            //将data写入指定路径
//            [responseObject writeToFile:path atomically:YES];
//            success(responseObject);
//            
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//+ (void)postObjectWithurl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{
//    
////    WDRequestObjectParam *params = params;
////    param.vision = @"1.1.0";
////    param.sign = @"xxxxx";
////  
//    url = @"http://192.168.1.121:85/api.do";
////    url = @"http://api.plusthree.cn/api.do";
//    url = @"http://interface.plusthree.cn/api.do";
//    
//
//
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    NSDictionary *datastr = param.postDict;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:datastr options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *JsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
////    param.data = JsonStr;
//    NSString *md5Str = [NSString stringWithFormat:@"%@%@%@%@%@",param.action,param.source,param.timestamp,param.data,param.vision];
//    param.sign = [self md5:md5Str];
//    NSDictionary *paramDict = [param keyValues];
//    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//    
//    [mgr POST:url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
+ (void)postWithImageUrl:(NSString *)url param:(id)params withImageArr:(NSArray *)imgArr success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",@"",url];
    
    NSDictionary *dict;
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
     mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    [mgr POST:urlStr parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {

        for (int i = 0 ; i<imgArr.count; i++) {
            UIImage *image = imgArr[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
            NSDateFormatter *formater = [[NSDateFormatter alloc] init];
            formater.dateFormat = @"yyMMddHHmmss";
            NSString *fileName = [formater stringFromDate:[NSDate date]];
            //filename图片路径名  如：20120236221333.jgp;
            //name：图片的说明
            [formData appendPartWithFileData:imageData name:@"imageurl" fileName:fileName mimeType:@"image/png"];
            
            
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"error");
        }
    }];
}
+ (void)oauthInfoWithUrl:(NSString *)url param:(id)params success:(void (^)(id responseObj))success failure:(void(^)(NSError *error))failure{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
