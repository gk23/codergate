测试
========
rspec插件，可以自动测试
以下命令可以执行测试
	rake test:unit
	rake test

登录过滤验证
==========
1. `ApplicaitonController`中定义`before_filter :auth`，实现`auth`方法
2. 其他`controller`中的莫个`action`如果不希望被过滤，可以通过`skip_before_filter :auth, only=>[:create,:new]`来避免执行`create`或`new`之前执行`auth`方法

layout
========
1. 默认都使用view/layouts下的application.html.erb  
2. 如果controller使用自己的layout，例如lesson_controller，
	* 可以在view/layouts下添加lesson_layout.html.erb
	* 然后在lesson_controller中指定`layout "lesson_layout"`，则所有action都会使用lesson_layout
	* layout可以通过only, except选项，指定action。例如`layout "lesson_layout"，:only=>[:show]`,不过这样同controller的其他action将默认不使用任何layout
3. 如果某个action想要使用自己的layout,其他action使用默认的layout,可以在action中的render方法中指定layout来完成。  
	`format.html { render :layout=>"lesson_layout"}`
4. 给layout传送变量。
	* 在view中定义变量, `<% @title = "创建用户"%>`
	* 在layout中可以调用变量。如 `<title><%= @title %></title>`


局部模板
=========
