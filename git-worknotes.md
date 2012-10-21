基本介绍：
===========
git提交一个新文件需要三步：
  ○ Git add 
  ○ Git commit -m ""
  ○ Git push
git默认不会跟踪是否有新加的文件，如果要让git跟踪的话，对新文件需要使用 git add将文件添加到git跟踪索引中；
Git commit 只是将文件提交到本地的git索引
Git push 将commit的内容更新到服务器（repository）中


常用命令：
============
  ○ 项目加入git版本控制: git init
  ○ Checkout : Git clone http://...
  ○ 查看修改：git status
  ○ 提交到本地：git commit -m "this is a update action."
    § Git commit -a 可以不用每次commit前使用git add, 但是untrack的新文件必须执行一个git add <filename>后才能用git commit -a
    § Git commit -v 可以查看提交所有文件的具体修改内容
  ○ 提交到服务器：在git commit后执行git push
  ○ 从服务器更新：git pull
  ○ 查看提交记录：git log， 会显示如下图所示的 commit <value>
  ○ 显示具体提交信息：git show <value>, 其中value为ad30…0b9这段数字

配置用户名和密码，git提交时需要用户信息
Git config --global user.name 'aoaogk'
Git config --global user.email 'aoaogk@gmail.com'
 
Git config
===========
windows下会在%USERPROFILE% (C:\Users\Administrator)下建立.gitconfig文件
linux会在 ~下建立.gitconfig文件

修改本地和github上的注释
=======================
确保目前没有commit的文件，执行以下步骤：
  a. Git rebase -I HEAD~6   #其中6为最近的倒数6个版本，会列出6个pick 注释行
  b. 将要需要的那行comment中pick改为edit
  c.  git commit --amend #变为edit那行的注释，修改为正确后保存，退出
  d. 重复上两步，修改其他的，每次只能修改一行
  e. 提交github上，git push --force

支持中文：
==========
1. Git bash不能输入中文注释，解决办法：修改git/etc/inputrc中对应的行： 
set output-meta on 
set convert-meta off 
这个不可用，照样不能打印中文，全是？

2.push后github上中文乱码
git config --global i18n.commitencoding gbk
git config --global i18n.logoutputencoding gbk
这个不可用，上传后注释还是乱码

window下不要提交中文注释

3. git log support chinese，在git/etc/profile
export LESSCHARSET=iso8859

Git  bash下输入git log 可以显示中文注释
源文档 <http://blog.zzjin.net/tag/git/> 

push时自动输入用户名密码
========================
linux下：在~下创建.netrc文件
windows下：在%USERPROFILE%下创建_netrc文件，写入：

  machine github.com
  login aoaogk@gmail.com
  password 1...r


丢弃本地修改，被服务器端覆盖
===============================
`git checkout 文件名`， 如`git checkout app\controllers\sessions_controller.rb`


参考资料
==========
<http://zensheno.blog.51cto.com/2712776/490748>