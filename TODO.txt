2011/12/8
调整Ruby server为mongrel
1 在gemfile中添加
gem 'Mongrel'
2 运行rails  server 自动使用mongrel替换WEBrick

2011/12/9
每个courses添加链接，显示下级lessons页面
需要添加lesson表
Rails g scaffold lesson 


整理命名规则：
	○ 生成命令时是否复数
	○ 数据库命名
	○ view、controller等文件命名
	○ 类命名、函数、变量等命名

2011/12/12
通过查看css配置，复制codecademy的CSS和DIV结构，通过firebugs查DIV的id和结构，dreamweaver中application.css中每个id的配置。
	• head和foot，
	• courses页面。
	• 如何固定高度，使得footer部分始终在下面？

2011/12/13
完成http://127.0.0.1:3000/courses# 基本界面设计

2011/12/14
需要上传到google.code中，
添加几个数据表：users，cups，user_cups, user_courses, lessons, exercises
补充勋章的图片，能够显示图片
a.link, visited, hover的意思，记录在DIV经验中

2011/12/19
cups表插入数据的migration：
使用yaml，但是执行一个migrate任务后，如何重复执行某一个migration的rb任务
显示图片

2011/12/21
显示lesson列表
问题：如果手动通过SQLite Admin插入数据，如果有中文，会出现以下错误
invalid byte sequence in UTF-8

2011/12/22
继续完善lesson列表显示
源文档 <http://127.0.0.1:3000/courses/1> 

2011/12/30
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
添加互操作界面和解析javascript功能

2012/01/08
已增加基本的互操作界面，能够解析javascript语言，
基本框架已经完成。
TODO:
0.注册页面之前需要重新规划view的结构，删除不用的erb，注册页面叫做register.html，
  先考虑如何将user\index.html.erb变为路径是register，将erb改掉还是修改路由配置
1.注册页面，支持用户登录后的页面展示和用户基本信息和修改。参考douban
2.每一个页面,需要按运行要求调整，包括内容和界面。
3.练习界面：需要对每一个练习，增加用户输入的验证功能，如果按要求输入，提示相应答案，并且记录当前练习已完成。

2012/01/10
正在看第四版的route
如何查看所有symbol？现在不知都有哪些symbol可用
	A: puts Symbol.all_symbols
执行单个ruby文件: ruby test.rb, 如果里面直接写puts Symbol.all_symbols，就会打印所有symbols
e-texteditor使用CTRL+R不能执行
rake about显示所有gem版本和环境

2012-06-09
第一期：登录、可以学完一个js课程、积分体系
登录页面：
完善课程

2012-07-03
login页面逻辑，登录后返回courses首页，右边显示用户信息
导航栏需要为变量，登录/注册钮在用户登录后换成用户个人信息
登录需要pwd加密+salt