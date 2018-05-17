# 项目结构
src/main/java : 源代码目录 <br/>
src/main/java/bookstore/domain : 模型类包（也就是model）<br/>
src/main/java/bookstore/dao : 持久层类包（就是使用jdbc来实现对数据库的CRUD）<br/>
src/main/java/bookstore/service : 服务层类包（业务逻辑，给controller使用的）<br/>
src/main/java/bookstore/controller : 控制器类包（用于接受请求，处理请求，然后将数据返回给视图）<br/>

src/main/resources : 存放各种配置文件（spring、sql）<br/>
src/main/webapp : web容器根目录。<br/>
src/main/webapp/css  /js  ： 存放css、js文件<br/>
src/main/webapp/WEB-INFO/jsp ： 用于存放jsp文件<br/>

.gitingore : 里面写了上传到github时，会自动过滤掉的文件<br/>

pom.xml : 项目包依赖管理，可自行添加需要的包<br/>

# 进度报告：
目前已经配置好了spring容器，可以直接上手写代码了。<br/>
# 须知
clone项目到本地后，先修改 src/main/resources/sql/jdbc.properties 里的数据库连接配置为自己本地的，不过建议大家统一成一样的。<br/>
然后运行一下 src/main/resources/sql/sql.sql 脚本创建数据库和测试表<br/>
然后自行配置tomcat，运行，访问 http://localhost:8080/bookStore/testPage?id=1 ，如果网页出现 “testName” ，那么说明spring配置成功。<br/>

# 关于如何使用github进行团队开发<br/>
0.github上的master分支是我们项目的稳定版本，不要随意去更改其中的代码<br/>
1.先在本地 git clone git@github.com:mmlinhang/BookStore.git <br/>
2.然后 cd BookStore ，这就是我们的项目根目录了<br/>
3.然后 git checkout -b dev ：新建分支，这是我们的开发分支，大家在这个分支上进行开发，不要轻易改动master分支代码。<br/>
4.在dev分支上开发到一定程度后（比如完成某些比较完整的功能后），可以尝试合并代码到远程仓库，合并步骤如下：<br/>
  ①先切换到master分支：git checkout master<br/>
  ②然后再更新master为最新的版本（因为可能有其他人已经在远程master做了更新）：git pull origin master<br/>
  ③然后再将dev分支合并到master分支上：git merge dev。  <br/>
   merge可能（大概率）会出现冲突，这时候需要你手动进行合并，合并完之后再 git add . 和 git commit -m "这个字符串自行编写"<br/>
   注意：你整合代码之后需要进行测试，不仅要测试自己写的功能，还要测试别人写的功能是否受到你的影响<br/>
  ⑤更新远程仓库：git push origin master<br/>
   这一步可能也会出现冲突（因为可能有人在你git pull之后，又在远程master上进行了更新），这时候你就需要继续git pull 然后解决冲突， 最后再git push了<br/>
   
tips：这些过程中，最麻烦的可能就是合并这一步了，合并的时候可以和写相关代码的人讨论<br/><br/>
      有些地方没写清楚，大家不懂的可以百度或者一起讨论
