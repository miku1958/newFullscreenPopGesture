# newFullscreenPopGesture

全屏左划pop手势swift版本

仅测试swift 3.1

代码稍微参考了FDFullscreenPopGesture,可以当成FDFullscreenPopGesture的swift简化版本

没有FDFullscreenPopGesture的单独设置某些控制器不用全屏返回

个人觉得没必要,而且swift3.1都打算废弃initialize()类方法了所以实现起来有点绕




#使用方法

直接把UINavigationController+newFullscreenPopGesture.swift文件拖进项目就行

如果想要为UINavigationController做拓展,尽量不要重写viewDidLoad()就行


#已知问题

返回时到1/4屏幕松手,左上角的返回按钮文字有可能会乱跳
pop结束后左上角的返回图标有可能不消失