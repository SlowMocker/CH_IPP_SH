//
//  CHDeviceInfo.h
//  CH_IPP_SH_SDK
//
//  Created by Wu on 17/3/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

/*
 论 创建一个好 Model 的重要性
 
 其实一开始我在创建设备数据模型的时候，并不知道摄像头设备和 IPP 设备是混在一起使用的。所以我创建了一个 IPP 设备数据模型和一个摄像头设备数据模型。
 但是在后期使用上遇到了很大的麻烦（iOS 是后来加进去的，安卓已经做完）:
 1. web 返回给我的设备数据混在一起，我要使用就需要将其解析成一个数组，数组中包含着不同类型的数据模型
 2. 我提供给 web 的数据是各种设备分开独立的。web 觉得麻烦，需要我混在一起了给他
 
 上面两个问题: 我不得不专门写一个适配器来进行数据转换。工作量其实挺大的。
 
 我一开始是根据云端提供的接口返回的数据建的数据模型，后来才知道，云端返回的数据不全面。比方说有些界面需要显示某个设备的额外信息，但是云端数据获取接口
 并没有返回这个字段信息，需要再去请求另一个接口。这也给我带来了很大的麻烦 :
 1. 需要我对数据模型进行修改，需要我去很多其它地方给数据模型的新字段给值。比方说我分享给别人一台设备，这台设备的 shareTo 字段就要我手动赋予被分享者的电话号码
 2. 给我个人内心的"草泥马"激素打了一支兴奋剂
 
 ****************************************************退出登陆时记得清楚本地存储的数据。
 
 总结原因:
 1. 云端太垃圾
 2. 自己在高压时太紧张
 
 */


#import "CHBaseModel.h"

// CHIPPDeviceInfo 包含了 IPPDeviceModel 的所有属性

@interface CHIPPDeviceInfo : CHBaseModel
// 设备id
@property(nonatomic , copy)NSString *devid;
// 设备昵称
@property(nonatomic , copy)NSString *nickname;
// 软件版本
@property(nonatomic , copy)NSString *swver;
// 硬件版本号
@property(nonatomic , copy)NSString *hwver;
// 网关id
@property(nonatomic , copy)NSString *linker;
// 分享该设备的用户
@property(nonatomic , copy)NSString *sharefrom;
// 该设备分享给的用户
@property(nonatomic , copy)NSString *shareto;
// 该设备分享给的用户 id 数组。其实就是对 shareto 属性的拆分
@property (nonatomic , strong) NSArray<NSString *> *shareToIds;
// 设备是否绑定
// 这个属性只是用来区分设备是否已经被绑定和没绑定。如果 A 分享一个设备（由 A 绑定）给 B，那么 B 获取到的设备中该属性依旧是 YES。
@property(assign, nonatomic)BOOL isBinded;
// 判断该设备是否是自己绑定
@property (nonatomic , assign) BOOL isSelfBinded;
// 设备条码
@property(nonatomic , copy)NSString *sn;
// 设备类型id
@property(nonatomic , copy)NSString *categoryid;
// 设备类型
@property(nonatomic , copy)NSString *category;
// 产品id
@property(nonatomic , copy)NSString *productid;
// 产品名称
@property(nonatomic , copy)NSString *productname;
// 设备型号
@property(nonatomic , copy)NSString *model;
// MAC地址
@property(nonatomic , copy)NSString *mac;
// 在线状态（0不在线，1在线）
@property(nonatomic , assign)int online;

@property(nonatomic , copy)NSString *memo;

// 设备连接类型，IPPDeviceConnectType枚举值
// 0 远程
// 1 本地 （还未绑定，待商讨）
// 这个属性和 isBinded 有重合
@property(nonatomic , assign)int connectType;


@end
