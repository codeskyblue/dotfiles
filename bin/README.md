## 百度里常用的一些工具
过去写了好多，我挑几个我非常喜欢的，介绍下

### colortailf

>过去是用tailf日志，用了colortailf日志就有了颜色。挺好玩的

### svnclean

>svn status代码的时候，经常会遇到一堆感叹!号。这个小程序可以自动解决了它们

### restart-archer

> 一个后门，如果archer第一次部署失败了，从网页上拿到该次部署的id，`./restart-archer $id`，跑一遍这个命令，archer会重新部署一次。

### uic

>后门中的战斗机. 我不解释了

### share
>正如其名，分享文件。执行下命令 `share filename`， 就会生成一个下载地址。然后hi给想给的人，还是挺方便的

### benchmark
>并发的跑命令，用来测试的。
比如

	./benchmark --concurrency=20 echo hello

程序就会开20个进程，去运行`echo hello`

### to
>方便的在机器间跳来跳去。 比如`to 18`就跳转到了cp01-yxtocp018.vm

### 其他。太多了，我就不写了。看代码也很容易理解
