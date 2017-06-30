# Centos study
## 2017/6/21
begin use linux
CentOS 7
## 2017/6/22
	* yum install 		/*get the new base; get the epel yum; get the rem yum*/	
	* install vm-tool 	/*change the CD-ROM*/
	* about vi 	
		* -vi a b c       change the a and b and c	编辑a,b,c三个文档
		* -:n				go to the next file			打开下一个文档
		* -:N				go to the prev file			打开上一个文档	
		* -i 				enter the content in the cursor (Inser mode)	在光标处插入信息
		* -a 				enter the content in the next cursor			在光标后插入信息
		* -v 				use the view mode			使用观察模式
		* -yy 			in the view mode we can use this command copy some this	在观察模式下进行复制
		* -p				paste the content			粘贴信息
		* -j				move the cursor down		向下移动光标
		* -k				move the cursor up			向上移动光标
		* -h				move the cursor left		向左移动光标
		* -l				move the cursor right		向右移动光标
		* -:w				save the content			保存操作
		* -:q				quite the file				退出操作
		* -:q!			forced exit					强制退出
		* -:wq  			save the content then quite	保存并退出
		* -dd				delete the line where cursor on	删除当前行
	
	* yum groupinstall "Development Tools"							/*about build-essential*/
	* http://blog.csdn.net/lcj200813138020/article/details/46914161  	/*change the yum base*/
	* https://mirrors.tuna.tsinghua.edu.cn/help/epel/					/*get the tsinghua yum*/
	* http://www.07net01.com/2014/09/170342.html						/*get the build-essential/*/
	* http://www.cnblogs.com/hlb430/archive/2012/05/11/2613045.html	/* get the other yum */
	* http://bbs.csdn.net/topics/390606349							/*about de share*/
## 2017/6/25

Ready use git.I decide to use the github become my server repositories.Now begin!

This my PC informantion.

#cat /proc/version
Linux version 3.10.0-514.21.2.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-11) (GCC) ) #1 SMP Tue Jun 20 12:24:47 UTC 2017
CentOS Linux release 7.3.1611 (Core)

#lsb-release -a	/* if you want to us this command you need to install lsb and you could install that by this command #yum install -y redhat-lsb */
LSB Version:	:core-4.1-amd64:core-4.1-noarch:cxx-4.1-amd64:cxx-4.1-noarch:desktop-4.1-amd64:desktop-4.1-noarch:languages-4.1-amd64:languages-4.1-noarch:printing-4.1-amd64:printing-4.1-noarch
Distributor ID:	CentOS
Description:	CentOS Linux release 7.3.1611 (Core) 
Release:	7.3.1611
Codename:	Core

First we need to install the git.My base yum is Tsinghua.The yum newest edition is 1.8.3.1 but the newest edition is 2.13.1.So i decide to install the new edition.

#yum remove git		/* remove the old editon */

/* install the library */
#yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
#yum install gcc perl-ExtUtils-MakeMaker

#wget https://github.com/git/git/archive/v2.9.2.tar.gz	/* get the new git */

#tar -xzvf v2.9.2.tar.gz
#cd git-2.9.2
#make prefix=/usr/local/git all
#make prefix=/usr/local/git install

/* export path */
#vi /etc/profile
we need to add : export PATH="/usr/local/git/bin:$PATH"
#source /etc/profile 	/* effective immediately */

#git --version			/* the edition informantion */

/* create a new group */ 
#groupadd git
#useradd git -g git
#passwd git
#su git

If finsh all.We're already install git.

Second,we need to get the ssh key.

#git config --global user.name"user.name"				/* "user.name" is your username */
#git config --global user.email"yourmail@youremail.com"	/* "yourmail@yourmail.com" is your email */
#cd ~/.shh												/* check the ssh keys.if tip "No such file or directory".you need to creat a ssh keys */
#ssh-keygen -t rsa -C "youremail@youremail.com"

if you finsh that,you could find 2 files be creat."rd_rsa" and "id_rsa.pub"

Third,we need to sgin up a github.
The github web:https://github.com/
Then we need to creat a repositories.
Login our github.Click "Edit profile".Click "SSH and GPG keys".
We could add a new ssh keys in here.Click "New SSH key".
The title you cloud write something what you like.The key is the content in the "rd_rsa".We copy that and add in the key.

#ssh -T git@github.com									/* If tip:You've successfully authenticate,but GitHub does not provide shell acces.You successfully connection the github */

End,we could test.

#cd /home/git
#vi test
#:wq
#git add test
#git commit -m "test"
#git remote add origin https://github.com/YourGithubName/YourRepositoriesName
#git push -u origin master

You could see your code had push the github!

Reference materials
http://www.cnblogs.com/xuange306/articles/6800794.html
http://www.cnblogs.com/xuange306/p/6403907.html
http://www.cnblogs.com/wangmingshun/p/5424767.html

2017/6/26

关于git与github的基础命令总结

git的初始化设置
	#git config --global user.name "user.name"					/* 建立git用户名 "ser.name"=>git用户名 */
	#git config --global user.email "yourmail@youremail.com"	/* 建立git邮箱 yourmail@youremail.com"=>git邮箱" */
	#ssh-keygen -t rsa -C "youremail@youremail.com"				/* 创建密钥，密钥存放位置为 ~/.ssh */
	#ssh -T git@github.com 										/* 连接测试 */
	#git init 													/* 在当前目录建立仓库 */
	
git基本操作
	#git add demon												/* 将demon添加到缓存区 */
	#git diff demon												/* 查看demon的修改信息 */
	#git commit -m "magess"										/* 将缓存区内容提交给当前分支，提交留言为magess */
	#git status 												/* 状态查询 */
	#git log 													/* 查看git 日志 */
	#git reset  –-hard HEAD^ 									/* 回退到上个版本 */
	#git reset  –-hard HEAD~n									/* 回退到n个版本 */
	#git reflog													/* 版本号查询 */
	#git reset  –-hard edition									/* 回退到版本号为edition的版本 */
	#git checkout  — file 										/* 把file文件在工作区做的修改全部撤销
																	1.file自动修改后，还没有放到暂存区，使用 撤销修改就回到和版本库一模一样的状态。
																	2.另外一种是file已经放入暂存区了，接着又作了修改，撤销修改就回到添加暂存区后的状态。
																	(也可以适用于文件删除后的恢复)
																*/
	#git branch													/* 查看所有分支(当前分支前面有*标记) */
	#git branch demon 											/* 创建名为demon的分支 */
	#git checkout demon 										/* 切换到demon分支 */
	#git checkout –b demon 										/* 创建并切换到demon分支 */
	#git branch –d demon   										/* 删除demon分支 */
	#git merge dev 												/* 将demon分支合并到当前分支 */
	#git stash 													/* 工作现场掩埋 */
	#git stash list 											/* 查看工作现场列表 */
	#git stash apply											/* 恢复工作现场 */
	#git stash drop 											/* 删除一条工作现场 */
	#git stash pop 												/* 恢复并删除工作现场 */

本地库与远程库的关联操作
	#git remote add origin https://github.com/githubName/repositoriesName 	/* 设置github远程库连接  origin=>远程库名称(自定义) githubName=>git账号 repositoriesName=>远程库名 */
	#git push -u origin master 									/* 把本地库的主分支master推送到远程库，第一次推送加-u参数，以后可以不加 */
	#git clone https://github.com/githubName/repositoriesName 	/* 克隆远程库到本地 githubName=>git账号 repositoriesName=>远程库名(克隆后的远程库名默认为origin) */
	#git remote 												/* 查看远程库信息 */
	#git remote –v 												/* 查看远程库详细信息 */
	#git fetch origin master 									/* 抓取origin远程库的主分支 */
	#git fetch origin master:demon 								/* 抓取origin远程库的主分支放入demon分支内 */
