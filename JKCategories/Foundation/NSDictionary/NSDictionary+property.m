//
//  NSDictionary+property.m
//  生成属性代码
//
//  Created by 王文娟 on 16/12/1.
//  Copyright © 2016年 EJU. All rights reserved.
//

#import "NSDictionary+property.h"

@implementation NSDictionary (property)

-(NSString *)createProperty{
    
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            [str appendFormat:@"@property (nonatomic, assign) BOOL %@;\n",key];
        }else if ([obj isKindOfClass:[NSString class]]||[obj isKindOfClass:[NSNumber class]]) {
            [str appendFormat:@"@property (nonatomic, copy) NSString *%@;\n",key];
        }else if ([obj isKindOfClass:[NSArray class]]) {
        
            [str appendFormat:@"@property (nonatomic, strong) NSArray *%@;\n",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]) {
            
            [str appendFormat:@"@property (nonatomic, strong) NSDictionary *%@;\n",key];
        }

    }];
    return str;
}
@end
