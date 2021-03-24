第二次实验报告

Lesson1.1 , 1.2 , 1.3:[![asciicast](https://asciinema.org/a/R1IuphpAw6BQNLBRaTqIPyiu5.svg)](https://asciinema.org/a/R1IuphpAw6BQNLBRaTqIPyiu5)

Lesson1.4 , 1.5:[![asciicast](https://asciinema.org/a/JrplJU9SNusPgrLkhbpLwb4Dy.svg)](https://asciinema.org/a/JrplJU9SNusPgrLkhbpLwb4Dy)

Lesson1.6:[![asciicast](https://asciinema.org/a/Gx86s0ZYBi4BrBsUtvnTjfxQN.svg)](https://asciinema.org/a/Gx86s0ZYBi4BrBsUtvnTjfxQN)

Lesson2.1 , 2.2 , 2.3 , 2.4:[![asciicast](https://asciinema.org/a/y6ZT3eaJElUwf7VvLpRQ03lc4.svg)](https://asciinema.org/a/y6ZT3eaJElUwf7VvLpRQ03lc4)

Lesson2.5 , 2.6 , 2.7:[![asciicast](https://asciinema.org/a/y6ZT3eaJElUwf7VvLpRQ03lc4.svg)](https://asciinema.org/a/y6ZT3eaJElUwf7VvLpRQ03lc4)

Lesson3.1 , 3.2 , 3.3:[![asciicast](https://asciinema.org/a/SRD81QJXmHwTuMuNIEGoPJlxb.svg)](https://asciinema.org/a/SRD81QJXmHwTuMuNIEGoPJlxb)

Lesson3.4 , 4.1 , 4.2 , 4.3:[![asciicast](https://asciinema.org/a/cfWhGs7hT4hdaliovFBfGrXu1.svg)](https://asciinema.org/a/cfWhGs7hT4hdaliovFBfGrXu1)

Lesson4.4 , 5.1 , 5.2:[![asciicast](https://asciinema.org/a/ZM3UdgfOjOa6TEYISLDdraYIl.svg)](https://asciinema.org/a/ZM3UdgfOjOa6TEYISLDdraYIl)

Lesson5.3 , 5.4:[![asciicast](https://asciinema.org/a/S6oycn7eYXBWJAUpConospVmw.svg)](https://asciinema.org/a/S6oycn7eYXBWJAUpConospVmw)

Lesson6.1 , 6.2 , 6.3 , 6.4 , 6.5:[![asciicast](https://asciinema.org/a/XQAqYq3k2iuOXg07WOF2qcamu.svg)](https://asciinema.org/a/XQAqYq3k2iuOXg07WOF2qcamu)

Lesson7.1 , 7.2 , 7.3:[![asciicast](https://asciinema.org/a/mmAjNZwYwupjyffRdsDApM6M7.svg)](https://asciinema.org/a/mmAjNZwYwupjyffRdsDApM6M7)
 # 自查清单 
  
1. vim工作模式种类 
  - 正常模式(normal-mode) 
  - 可视模式(visual-mode) 
  - 插入模式(insert-mode) 
  - 命令模式(command-mode) 
  
2. 数字+Ctrl-D 光标可以向下移动指定行数；G 光标移动到文件结束行，gg 光标移动到文件开始行；输入行号+gg可以快速转跳到行号所在位置 
  
3.  
   键入字符的作用 
   
   x：删除单个字符

   dw:删除单个单词  

   d$:删除到行尾

   dd:删除整行 

   ndd:删除光标所在向下n行 
  
4.  80i - 按esc就会出现80个- 
  
5.  u 撤销最近一次编辑操作,Ctrl-R 重做最近一次被撤销的操作 
  
6.  
   键入字符的作用 
  
   yl：复制光标右边1个字符 

   yh：复制光标左边1个字符 

   yw：复制一个单词 

   yy：复制整行文本 

   .： 实现相似操作   
  
7.    A、a、c、i、o、r、w 
  
8. Ctrl-G 显示当前文件位置、当前状态和所在行号 
  
9. 关键词搜索: /'key words'(Enter)

   查找下一个:'n',上一个'N'

   设置忽略大小写匹配搜索: set ic

   将匹配结果高亮显示: set hls is

   匹配到的关键词进行批量替换:

   替换当前行第一个字符: 's/old/new/'

   替换m行与n行之间所有字符: 'm,ns/old/new/g'

   全局替换: '%s/old/new/g'

10.  Normal 模式下执行 CTRL-O 和 CTRL-I

11.  光标停至某半括号处，按'%'，即跳转到对应匹配的括号

12.  !command

13. :help[快捷键名] + enter

     在两个不同的分屏窗口移动光标:通过 ':set mouse=a'开启 vim 的鼠标支持模式，然后就可以通过鼠标直接改变分屏窗口大小和切换不同分屏窗口选中状态了
