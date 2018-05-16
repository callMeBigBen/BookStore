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
1.大家在本地开发时，要新建一个分支进行开发<br/>
