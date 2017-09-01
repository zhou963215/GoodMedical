//
//  Url.h
//  GoodMedical
//
//  Created by zhou on 2017/8/8.
//  Copyright © 2017年 zhou. All rights reserved.
//

#ifndef Url_h
#define Url_h

#define BASEURL                      @"http://api.yimeiq.cn/"
#define TOKEN                        @"2b6f8cbb42c7653bdad50fcbcee12417"
#define PHOTO_BEFOR                  @"http://uploads.zm.yimeiq.cn/"

//短信
#define SMS_MODULE                   BASEURL@"sms"

#define MNS_SENDCODE                 SMS_MODULE@"send-code"//发送验证码
#define MNS_SENDMESSAGE              SMS_MODULE@"send-message"//发送短信

//登录

#define LOGIN_MODULE                 BASEURL@"login"

#define LOGIN_LOGIN                  LOGIN_MODULE@"login"//登录
#define LOGIN_WECHAT                 LOGIN_MODULE@"app-back"//微信登录
#define LOGIN_BIND                   LOGIN_MODULE@"bind-phone"//绑定手机

//预约
#define BESPEAK_MODULE               BASEURL@"bespeak"

#define BESPEAK_INDEX                BESPEAK_MODULE@"index"//预约1
#define BESPEAK_BESPEAK              BESPEAK_MODULE@"bespeak"//预约2
#define BESPEAK_PROJECT              BESPEAK_MODULE@"project"//获取预约项目数据
#define BESPEAK_SURGICAL_LIST        BESPEAK_MODULE@"surgical-list"//获取平台分类数据
#define BESPEAK_ORG_DOCTORS          BESPEAK_MODULE@"org-doctors"//获取某机构的医生
#define BESPEAK_BESPOKE_TIMES        BESPEAK_MODULE@"bespoke-times"//重新加载时间段数据
#define BESPEAK_HANDEL_BESPEAK       BESPEAK_MODULE@"handel-bespeak"//预约订单提交处理
#define BESPEAK_ISENABLE_TIMES       BESPEAK_MODULE@"isenable-times"//某个时间段是否可用
#define BESPEAK_BESPEAK_PAY          BESPEAK_MODULE@"bespeak-pay"//预约支付

//短信模块
#define SMS_MODULE                   BASEURL@"sms"
#define SMS_SENDCODE                 SMS_MODULE@"send_code"//发送验证码
#define SMS_SENDMEEAGE               SMS_MODULE@"send-message"//发送短信




#endif /* Url_h */
