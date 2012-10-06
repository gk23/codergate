2011/12/8
=========
调整Ruby server为mongrel  
1. 在gemfile中添加  
	gem 'Mongrel'  
2. 运行rails  server 自动使用mongrel替换WEBrick  

2011/12/9
=========
1.每个courses添加链接，显示下级lessons页面  
2.需要添加lesson表  
	Rails g scaffold lesson   
3.整理命名规则：  
	* 生成命令时是否复数  
	* 数据库命名  
	* view、controller等文件命名  
	* 类命名、函数、变量等命名  

2011/12/12
==========
通过查看css配置，复制codecademy的CSS和DIV结构，通过firebugs查DIV的id和结构，dreamweaver中application.css中每个id的配置。  
	* head和foot，  
	* courses页面。  
	* 如何固定高度，使得footer部分始终在下面？  

2011/12/13
===========
完成http://127.0.0.1:3000/courses# 基本界面设计

2011/12/14
===========
需要上传到google.code中，  
添加几个数据表：users，cups，user_cups, user_courses, lessons, exercises  
补充勋章的图片，能够显示图片  
a.link, visited, hover的意思，记录在DIV经验中  

2011/12/19
==========
cups表插入数据的migration：  
使用yaml，但是执行一个migrate任务后，如何重复执行某一个migration的rb任务  
显示图片  

2011/12/21
========== 
显示lesson列表  
问题：如果手动通过SQLite Admin插入数据，如果有中文，会出现以下错误  
invalid byte sequence in UTF-8  

2011/12/22
==========
继续完善lesson列表显示  
源文档 <http://127.0.0.1:3000/courses/1>   

2011/12/30
==========
修改lessons/show.html.erb，设计exercise的显示页面  
下面是DIV隐藏功能  

	<html>
	<script type="text/javascript">
	var curPane="tip1";
	function show(switchSysBar)
	{
	if(switchSysBar==curPane){return;}
	document.getElementById(curPane).style.display="none";
	document.getElementById(switchSysBar).style.display="block";
	curPane=switchSysBar;
	}
	</script>
	<p><a href="javascript:void(0)" onclick='show("tip1")'>111</a></p>
	<div id="tip1" style="display:block">333</div>
	
	<p><a href="javascript:void(0)" onclick='show("tip2")'>111</a></p>
	<div id="tip2" style="display:none">333</div>
	<p><a href="javascript:void(0)" onclick='show("tip3")'>111</a></p>
	<div id="tip3" style="display:none">333</div>
	</html>

2012/01/01
==========
添加互操作界面和解析javascript功能  

2012/01/08
==========
已增加基本的互操作界面，能够解析javascript语言，  
基本框架已经完成。  
TODO:  
1.注册页面之前需要重新规划view的结构，删除不用的erb，注册页面叫做register.html，
  先考虑如何将user\index.html.erb变为路径是register，将erb改掉还是修改路由配置  
2.注册页面，支持用户登录后的页面展示和用户基本信息和修改。参考douban  
3.每一个页面,需要按运行要求调整，包括内容和界面。  
4.练习界面：需要对每一个练习，增加用户输入的验证功能，如果按要求输入，提示相应答案，并且记录当前练习已完成。  

2012/01/10
==========
正在看第四版的route  
如何查看所有symbol？现在不知都有哪些symbol可用  
	A: puts Symbol.all_symbols  
执行单个ruby文件: `ruby test.rb`, 如果里面直接写puts Symbol.  all_symbols，就会打印所有symbols
e-texteditor使用CTRL+R不能执行
rake about显示所有gem版本和环境

2012-06-09
==========
第一期：登录、可以学完一个js课程、积分体系  
登录页面：  
完善课程  

2012-07-03
==========
login页面逻辑，登录后返回courses首页，右边显示用户信息  
导航栏需要为变量，登录/注册钮在用户登录后换成用户个人信息  
登录需要pwd加密+salt  
 
问题：
--------
windows下git.bash不能输入中文，cat 中文内容显示乱码，提交到服务器上的注释为乱码  

model中多对多的处理  
--------------------
1. 使用model和表名以ship结尾，如user_course_ship, 都为单数 <b>done.</b>  
2. ship的model中添加  

	belongs_to :users  
	belongs_to :courses  

3. user的model中添加,course的model类似  

	has_many :users_courses   
	has_many :courses,:through => :users_courses  

4. `user.courses` 可以得到所有关联的courses; `course.users`可以获得所有关联的users  

migration
-----------
1. 如何修改以前的migration，或者删除重建。表字段建错了，想删除重新建立 <b>done.</b>  

2012-07-04
==========
1. 问题: user.pwd返回 nil, User.find(1)    明明可以返回pwd的值。修改了pwd字段名称为password后正常。   
2. 导航栏中如何添加变量，用户登录和未登录显示不同？  
    如何  
3. yaml编写注意：必须用空格，不能用tab；key: value的形式冒号后需要一个空格  
4. 如何写测试用例和运行？rake test     
5. rspec的用法     

2012-07-05
==========
1. Helper的类别及用法,done.  
2. 重新构思网站结构，使用axure做一套原型，震中原则

2012-07-06
==========
axure制作原型, done

2012-07-07
==========
###1. 完善登录页面

    + 修改footer, done.
    + 增加注册链接, done
    + 密码加密/判断, 
    + 验证成功后，如果点击首页直接返回用户首页，而不是登录页面
        + 首页应该指向个人首页，如果session无用户id，则返回登录页面。  
    + 所有页面需要session过滤，如果没有id则返回登录页面,done.

###2. 制作登录首页

2012-07-10
==========
###完善个人登录页面
1. 左侧导航栏正确加载
2. 右侧内容显示完成课程信息及图表；如果没有课程显示添加课程的按钮

###问题总结
1. 方法前加self与不加有什么区别

    答：在方法前加不加self都是一样的，self表示实例对象  

2. Migration类中change 和up方法有什么区别？
    
    答：如果migration文件已以下开头，则rails会生成change方法，代替up和down，rails会知道如何做down的操作，所以不用实现down方法。  
    * add_column
    * add_index
　　* add_timestamps
    * create_table
    * remove_timestamps
    * rename_column
    * rename_index
    * rename_table


3. 主要的创建表、修改列的方法总结
4. 弄清路由写法与link_to, redirect_to, form中的action的常用写法；每次写一个URL一定要对应一个路由映射吗？刘瑞写link_to "新用户","/users/new" 或者 link_to " 主页", "/" 这些需要一个路由映射找到一个controller处理吗？

###markdown常用语法

1. pre和code标签（加背景颜色和code类型）：在每一行文字前添加 4个空格或者1个tab
2. <p>段落：
3. <br>换行：文字结尾加两个以上的空格
4. 标题：
    * setext-style: 文字下使用2个以上===表示标题1，---表示标题2
    * atx-style: 文字以#开头，相应#个数1~6个表示标题1到6
5. 加重<strong>和<em>: 文字首尾加*，数量越多越重。 例如：*注意*， **更加注意**
6. 有序列表：1. 
7. 无序列表：*,+,- 后面加空格
8. 链接：
    * 简单链接： <链接地址>， 如<baidu.com>展示成<a href="baidu.com">baidu.com</a>
    * 添加文字： [文字显示](链接地址 题目名)， 如 [百度主页](http://baidu.com "百度搜索")， 生成<a title="百度搜索" href="http://baidu.com">百度主页</a>
注意：pre在序列中不能显示，例如
1. hello
    
    this doesn't show pre and code style. 

2. bad

下面是可以的
hello

     this doesn't show pre and code style.

bad

2012-07-15
==========
###功能
1. 登录页： -p3
	* 注册:注册页面只有邮箱和密码；默认存储邮箱@前的为用户名。
	* 忘记密码  
	* 记住我  
	* 密码验证  
2. 登录后首页 - p1
	* header右边登录和未登录显示的判断 **done**,只有登录后状态，所以不用判断。
	* 左面nav部分的实现 done.
	* 添加课程的实现, 确保不会重复添加。正确逻辑是已经添加的不会有添加的按钮。done. 
	* 首页应为完成课程的图表展示
	* nav中添加个人信息. done.
	* 登录后header右上角导航包括所有课程/个人设置，个人设置包括个人信息修改，退出功能. done.
3. 	完善课程: p2
	* javascript：翻译现有的
	* rails: 自己按照agile web development的书写一个互动教程
	* 需要一个创建教程的编写及发布功能, [doing](#)
4. 添加页尾的关于我们等页面
5. 申请备案  

###界面
1. 登录页面：背景，产品截图，产品推广词
2. 登录后首页: 
	* header中logo位置和背景颜色
	* 主要内容的颜色/背景设计
3. 添加课程的课程列表页面
4. 个人设置页面
5. 具体练习页面

2012-07-16
==========
jsp, servlet和html.erb,controller的区别? 

    默认scaffold生成的view中都与model同名的目录，并且生成4个标准的html.erb，这些只是对model实体的操作。  
    * 如果有些html.erb没用，则可以删除；  
    * 可以在views中创建文件夹，放置同一功能块的页面；

[rspec单元测试](http://www.infoq.com/cn/articles/effective-rails-testing/)

2012-07-17
==========
###类型转换：to_i, to_f, to_s的应用  

###常用的tag：  
* <http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html>  
* <http://api.rubyonrails.org/classes/ActionView/Helpers/JavaScriptHelper.html>  

####js中实现兼容的跳转  
* window.location="http://baidu.com" 兼容各种浏览器

###devise_for
devise是一个验证(authentication)套件,使用方法见:  
1. <http://ihower.tw/rails3/auth.html>  
2. <http://cn.asciicasts.com/episodes/210-customizing-devise>  
3. <http://www.cnblogs.com/chengguyun/archive/2011/07/26/2117756.html>  

###routes常用写法
1. scaffold生成路由：resources :users
2. 自定义路径处理（类似spring中定义，不符合REST）
    match "/uploads/*path" => "gridfs#serve"
或者match "/uploads/*path", :to => "gridfs#serve"  
其中，URL是否以"/"开头无区别。"/uploads/*path"和"uploads/*path"是相同的，  
3. 某个controller中映射URL和action：
  controller :sessions do
    get 'login' => :login
    post 'login' => :create
    delete 'logout' => :destroy
  end
4. 单条简单路由
  get "sessions/new"  #生成 get "sessions/new", :controller=>:sessions, :action=>:new 
5. 嵌套路由 
    resources :products do
        resources :comments
        resource :seller
    end
6. shallow 嵌套路由. 与不加shallow的区别为，可以识别/comments/:id, 代替识别/products/:p_id/comment/:id
    resources :products, :shallow => true do
        resources :comments
    end
7 resource中定义member和collection块
  resources :users do
    collection do
      get "index"
      get "delete_all"
    end

    member do
      get "show"
      get "edit"
    end
  end   
8. namespace

render常用方法
---------------
1. render   
不加参数默认自己找template，如果有与action同名的则返回  

2. render(:action=>:index)
需要注意：不会

3. 返回字符串  
render :text=>"hello cups."  # 返回一个字符串

4. render(:inline=>%{\<h2>test inline\</h2>})  
通过inline参数可以直接写html代码并返回



### respond_to 


### link_to

2012-08-14
==========
做一个创建和修改课程的页面
几页的外观

完成：
1. exercise的数据更新
2. exercise的字段添加
3. 增加”创建课程“页面

TODO:
1. 点击创建新课程后，输入基本信息后，跳转到该课程编辑页，显示lesson列表，可以添加、删除lesson
2. 点击某个课程名后，跳转到上面页面


2012-08-16
==========
<<<<<<< HEAD
TODO:
1. 点击创建新课程后，输入基本信息后，跳转到该课程编辑页，显示lesson列表，可以添加、删除lesson
2. 点击某个课程名后，跳转到上面页面
=======
嵌套路由URL写法：
new_course_lesson_path(@course.id)
传递的参数为course_id

edit_course_lesson_path(@course.id,lesson.id)
传递的参数为course_id, lesson_id
相当于：/courses/#{@course.id}/lessons/#{lesson.id}/edit

只有创建lesson时才连带courses_id.只有new action需要带course_id的参数，add action可以从new页面中获得
显示和修改不用，因为lesson中存储course_id。包括add,edit, update, show, index,destroy
>>>>>>> 5978bb0ea9cd90a63a2acac27a36a4cb6266660f
