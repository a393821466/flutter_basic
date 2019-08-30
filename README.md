# 项目结构
```
  ├─android           //安卓工程目录
  │
  ├─images             //图片文件夹
  |  
  |-ios             //ios工程目录
  |
  |-lib
  │  |
  │  ├─components   //组件
  │  |
  |  ├─config       //公共配置
  |  |
  |  ├─models      //数据模型
  |  |
  |  ├─pages       //所有的page
  |  |
  |  └store        //状态管理
  |
  └test            //测试文件
```

- 最近一直在学习flutter，看了胖老师你的基础课程，我学到了挺多东西，非常感谢你的奉献。这段时间一直在消化，过段时间打算付费那套flutter移动商城,继续学习。今天上去看了flutter移动商城那片文章。跟着做了一些东西。在状态管理和数据模型那里出了写问题，找了很久都找不到是哪里都问题，希望胖老师有空到时候可以帮我看一下是什么原因。

## 遇到的问题

- 在写分类列表的时候，一开始本来打算跟着用provide，但是去github看了一下。好几个月都没更新过了。上网查了一下。听说谷歌推荐使用provider。然后就使用provider了。

- 这是分类api。如下链接

[https://easy-mock.com/mock/5d6109a5825d2b57ed75bbd6/example_copy/categoryList](https://easy-mock.com/mock/5d6109a5825d2b57ed75bbd6/example_copy/categoryList)

- 在状态管理内使用数据模型的泛型类就报错了,子分类渲染不出来。去掉泛型类是可以渲染的，只不过感觉这样不稳定。如下图:

![报错](https://github.com/a393821466/flutter_basic/blob/master/images/0.png)

- 状态管理的变量加入数据模型的泛型。如下图:

![加入泛型类](https://github.com/a393821466/flutter_basic/blob/master/images/1.png)

- 子分类的数据模型。如下图:

![model类](https://github.com/a393821466/flutter_basic/blob/master/images/2.png)

- 头文件使用provider状态管理。如下图

![provider](https://github.com/a393821466/flutter_basic/blob/master/images/3.png)

- 子分类数据Widget。如下图 （具体文件目录lib/pages/classifs_page.dart）

![子分类](https://github.com/a393821466/flutter_basic/blob/master/images/4.png)

- 子分类文字渲染。如下图  （具体文件目录lib/pages/classifs_page.dart）

![文字渲染](https://github.com/a393821466/flutter_basic/blob/master/images/5.png)