# ic卡管理系统
 :bowtie: 
### 介绍
#### 1、登录
  用户输入账号密码以及验证码登入系统，访问系统任意部分（除登录注册）均需要登录验证，否则操作被拦截；
确认账号存在时，但密码输入有误，可找回密码；
登录失败时：
  （1）当日登录机会减1，每日每个用户只有3次登录失败重新登录的机会，管理员及以上权限用户有不限时无限次登录机会；
 :see_no_evil: 
![登录设计-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/100732_f660d0a5_8091913.png "屏幕截图.png")
![登录-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/104935_61a9459c_8091913.jpeg "logo_page.jpg")
![登录失败-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/104958_9bca2777_8091913.jpeg "logo_error.jpg")
#### 2、注册
![注册设计-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/103354_a32f3797_8091913.jpeg "在这里输入图片标题")
  用户账号不存在通过注册向系统管理员申请注册，申请通过后可使用账号登录系统，注册需提供基本信息如下：
姓名、身份证、邮箱、电话、注册身份（例如：学生、儿童等）。
  申请注册：申请注册的条件是申请人身份证账号不存在账号信息，存在账号信息时提示用户已有账号无法注册，并提供忘记密码进行账号密码找回的功能；
  找回密码：找回密码提供二选一方式
  1、我知道个人信息：输入系统提供的验证码以及填写服务器随机生成的个人信息列表，验证码与信息项前后填写无误后可重新设置密码，进行登录。
  2、我不知道个人信息：此时需正确输入服务器提供的验证码，输入成功后，向管理员发送找回密码申请，用户下次再使用当前身份证找回密码时系统提供找回密码申请中页面，提示用户 ``您的账号正在申述中，请等待审核结果`` ,等待管理员确认申请信息后：
（1）管理员通过申请：密码设置为初始密码123456，用户下次再使用当前身份证找回密码时，系统提示用户账号申述通过，利用初始密码123456进行登录；
（2）管理员不通过申请，用户下次再使用当前身份证找回密码时，系统提示用户账号申述不通过，用户无法进行登录，可重新申述；
![注册-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/105021_8f32882f_8091913.jpeg "register_page.jpg")
![注册失败-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/105048_a5fc8147_8091913.jpeg "register_error.jpg")
![注册成功-CSDN四原色（xjh）](https://images.gitee.com/uploads/images/2021/1026/105104_02086ac4_8091913.jpeg "register_succeed.jpg")
#### 3、用户信息管理
  此功能模块下，显示用户基本信息、账号信息、IC卡信息、账户余额、IC卡余额、账单查询、消费记录、消费统计等，也可完善或修改个人基本信息，以及管理账号安全（修改登录密码以及支付密码）。
#### 4、退出登录
  用户退出系统，清除服务器session、中断连接，并清除本地cookie
#### 5、系统设置
  可修改界面风格，从提供的风格种类中选择。

### 功能模块
#### 1、Ic卡申请（注册）
  用户登录后，进入申请IC卡界面，可在线申请一张IC卡，卡号唯一，一个身份证最多同时申请一张IC卡，但可多次申请（即需要在注销后才可申请其他IC卡）；

#### 2、Ic卡充值
  用户对IC卡进行充值，单次充值最少1.00元人民币，最多1000.00元人民币，提供充值选项有：5元、10元、20元、50元、100元、500元和其他金额。
每张Ic卡余额上限5000.00元。

#### 3、Ic卡消费与商品管理
  进入消费商城后可选择消费模块进行商品购买，消费模块有且不限于以下：
    日用品（如卫生纸、牙膏、牙刷等）;
    学习用品（如草稿纸、笔、笔记本、2B铅笔）;
    生活缴费（水费、电费、手机充值等）等；

  所有商品分类管理与增减改都在管理端进行，并有管理员及以上权限的用户操作（管理端只能是管理员及以上权限的用户登录）；

#### 4、Ic卡挂失
  用户进入IC卡挂失界面选择挂失，挂失后卡余额冻结，任何人不能使用此卡进行消费；
  用户也可申请还原IC卡，得到管理员同意后，卡解除冻结，用户可继续使用卡。

#### 5、Ic卡注销
  进入注销页面，用户注销IC卡，注销卡后卡被立即冻结，当管理员同意注销时，卡内剩余余额返还到用户账号的钱包余额中，并且这张卡被注销，用户可在下次申请一张卡后使用这些余额充值卡。
 :ok_hand: 

## tip：
### 1、异步访问的Loading动画：
![异步访问的Loading动画](https://images.gitee.com/uploads/images/2021/1027/152330_11a10ecb_8091913.jpeg "loading.jpg")
视频展示位置： :heart:  **/file/loading.mp4** 

### 2、表格模板

--------------------------2021/11/12-13:30---------------------------------

![表格模板](https://images.gitee.com/uploads/images/2021/1112/134015_7ec97994_8091913.jpeg "表格模板案例.jpg")

### 3、ajax等待加载动画（新）
--------------------------2021/11/15-13:56--------------------------------
![等待加载动画](https://images.gitee.com/uploads/images/2021/1115/135730_9b9d9083_8091913.jpeg "loading-2.jpg")

### 4、个人信息页新增消费统计图表，图表样式如下（echart5.0.0）
![消费统计图表](https://images.gitee.com/uploads/images/2021/1116/235906_2003b531_8091913.jpeg "消费统计图.jpg")
