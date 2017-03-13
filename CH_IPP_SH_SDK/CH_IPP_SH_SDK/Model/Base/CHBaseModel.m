//
//  CHSBaseModel.m
//  IPPSmartManager
//
//  Created by Wu on 16/9/2.
//  Copyright © 2016年  electric Co.,Ltd. All rights reserved.
//


// 知识点：
// KVC
/*
 如果是动态设置属性，则优先考虑调用setA方法，如果没有该方法则优先考虑搜索成员变量_a,如果仍然不存在则搜索成员变量a，如果最后仍然没搜索到则会调用这个类的setValue:forUndefinedKey：方法(注意搜索过程中不管这些方法、成员变量是私有的还是公共的都能正确设置)；
 如果是动态读取属性，则优先考虑调用a方法（属性a的getter方法），如果没有搜索到则会优先搜索成员变量_a，如果仍然不存在则搜索成员变量a，如果最后仍然没搜索到则会调用这个类的valueforUndefinedKey:方法(注意搜索过程中不管这些方法、成员变量是私有的还是公共的都能正确读取)
 */


#import "CHBaseModel.h"

#import <objc/runtime.h>


@implementation CHBaseModel

- (id)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        if (dic) {
            [self setValuesForKeysWithDictionary:dic];
        }
    }
    return self;
}
// 实现这个方法，防止动态设置属性时，因为找不到对应的变量而崩溃。
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // to do ...
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

// 对象转字典
- (NSDictionary *)toDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    NSArray *propertyNames = [self getAllProperties:[self class]];
    for (NSString *propertyName in propertyNames) {
        id property = [self valueForKey:propertyName];
        
        // isKindOfClass:不仅可以判断目标类，还可以判断目标类的派生类
        if ([property isKindOfClass:[NSArray class]] || [property isKindOfClass:[NSSet class]]) {// 如果获取到的属性是个数组，需要进一步获取
            NSMutableArray *arrM = [NSMutableArray arrayWithArray:property];
            for (id object in property) {
                if ([object isKindOfClass:([CHBaseModel class])]) {
                    NSDictionary *dic = [object toDictionary];
                    [arrM removeObject:object];
                    [arrM addObject:dic];
                }
            }
            [dic setValue:[arrM copy] forKey:propertyName];
        } else if ([property isKindOfClass:[CHBaseModel class]]) {// 如果是该类型，继续获取
            [dic setValue:[property toDictionary] forKey:propertyName];
        } else {
            // setValue:forKey:所以这里不用判断property是否为nil
            // 如果是setObject:forKey:就必须判断property是否为nil
            // setValue: & setObject:区别1
            // 前者可以传nil，后者不行。在mutableDic中，调用前者，如果值不是nil，实际调用的是setObject:。如果调用前者值是nil，则调用的是removeObjectForKey
            [dic setValue:property forKey:propertyName];
        }
    }
    return [dic copy];
}

- (NSString *)toJson {
    NSString *json;
    NSDictionary *dic = [self toDictionary];
    if (dic != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    return json;
}

- (NSArray *)getAllProperties:(Class)class {
    NSMutableArray *properties = [NSMutableArray new];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t propertyName = propertyList[i];
        const char *cName = property_getName(propertyName);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [properties addObject:name];
    }
    return [properties copy];
}

//#pragma mark
//#pragma mark NSCodingProtocol
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    NSArray *properties = [self getAllProperties:[self class]];
//    for (NSString *name in properties) {
//        [aCoder encodeObject:[self valueForKey:name] forKey:[NSString stringWithFormat:@"c_%@_%@",NSStringFromClass([self class]),name]];
//    }
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super init];
//    if (self) {
//        NSArray *properties = [self getAllProperties:[self class]];
//        for (NSString *name in properties) {
//            [self setValue:[aDecoder decodeObjectForKey:[NSString stringWithFormat:@"c_%@_%@",NSStringFromClass([self class]),name]] forKey:name];
//        }
//    }
//    return self;
//}
//#pragma mark
//#pragma mark NSCopyingProtocol
//- (instancetype)copyWithZone:(NSZone *)zone {
//    CHBaseModel *new = [[[self class] allocWithZone:zone] init];
//    if (new) {
//        NSArray *arr = [self getAllProperties:[self class]];
//        if ([arr count] != 0) {
//            for (NSString *name in arr) {
//                [new setValue:[self valueForKey:name] forKey:name];
//            }
//        }
//    }
//    return new;
//}

@end
