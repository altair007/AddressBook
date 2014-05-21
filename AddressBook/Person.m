//
//  Person.m
//  AddressBook
//
//  Created by   颜风 on 14-5-19.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - 便利构造器
+ (instancetype) personWithName: (NSString *) name
                                   tel: (NSString *) tel
{
    Person * person;
    person = [[self class] personWithName: name
                                             tel: tel
                                           group: nil];
    
    return person;
}

+ (instancetype) personWithName: (NSString *) name
                                   tel: (NSString *) tel
                                 group: (NSString *) group
{
    Person * person;
    person = [[[self class] alloc]initWithName:name tel:tel group:group];
    
    return person;
}

#pragma mark - 便利初始化
- (instancetype) initWithName: (NSString *) name
                          tel: (NSString *) tel
{
    if (self = [self initWithName:name tel:tel group:nil])
    {
        // 暂时不需要做任何事
    }
    
    return self;
}

- (instancetype) initWithName: (NSString *)name
                          tel: (NSString *)tel
                        group: (NSString *) group
{
    if (self = [super init])
    {
        // 电话是否全部为数字?
        if (NO == [self isAllNumber:tel])
        {
            return nil;
        }
        
        // 去除姓名两端的空格
        name = [name stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceCharacterSet]];
        
        // 姓名是否为空?
        if (nil == name || [@"" isEqualToString: name])
        {
            name = @"无名氏";
        }
        
        // 分组是否为空?
        if (nil == group || [@"" isEqualToString:group])
        {
            group = @"默认";
        }
        
        // 设置属性
        self.name = name;
        self.tel = tel;
        self.group = group;
    }
    
    return self;
}

#pragma mark - 实例方法
- (void) show
{
    NSString * info;
    info = [NSString stringWithFormat:@"%@ %@ %@", self.name, self.tel, self.group];
    
    NSLog(@"%@", info);
}

#pragma makr - 工具函数
- (BOOL) isAllNumber: (NSString *) str
{
    // str是否为nil或者空串?
    if (nil == str || [@"" isEqualToString:str])
    {
        return NO;
    }
    
    // str是否含有0~9以外的字符?
    for (NSUInteger i = 0; i < str.length; i++)
    {
        // 通过ASCII码值比较
        NSUInteger temp = [str characterAtIndex:i];
        if (temp < '0' || temp > '9')
        {
            return NO;
        }
    }
    
    return YES;
}

@end
