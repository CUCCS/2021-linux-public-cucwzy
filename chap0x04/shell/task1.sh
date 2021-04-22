#!/usr/bin/ev bash
function help_file
{ 
       echo "-a        支持对jpeg格式图片进行图片质量压缩"
       echo "-b        支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率"
       echo "-c        支持对图片批量添加自定义文本水印"
       echo "-d        支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名"
       echo "-e        支持将png/svg图片统一转换为jpg格式图片" 
       echo "-h        获取帮助信息"
}

#支持对jpeg格式图片进行图片质量压缩
function quality_compresion()
{      
       for f in $(ls); 
	   do
              i=${f#*.}
              if [[ $i == "jpg" ]];
			  then
                     convert -quality 80 $f ${f%.*}-compression.jpg
                     echo ${f%.*}-compression.jpg 
              fi
       done
}

#支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
function resolution_compression()
{
       for f in $(ls); 
	   do
              i=${f#*.}
              if [[ $i == "png"||$i == "svg"||$i == "jpg" ]];then
                     convert -resize 10000@ $f ${f%.*}-resize.$i 
                     echo ${f%.*}-resize.$i
              fi
       done
}

#支持对图片批量添加自定义文本水印
function add_watermark()
{
       for f in $(ls); 
	   do
              i=${f#*.}
              convert $f -gravity center -fill black -pointsize 16 -draw "text 2,5 'watermark'" ${f%.*}-watermark.$i 
              echo ${f%.*}-watermark.$i
       done
}

#支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
function rename()
{
       for f in $(ls); 
	   do
              i=${f#*.}
              mv $f $1$f
              echo "${f%.*} add perfix"
              mv $f $f$1
              echo "${f%.*} add suffix"
       done
}

#支持将png/svg图片统一转换为jpg格式图片 
function change()
{
       for f in $(ls); 
	   do
              i=${f#*.}
              echo $i
              if [[ $i == "png"||$i == "svg" ]];
			  then
                     convert $f ${f%.*}.jpg
                     echo ${f%.*}.jpg
              fi
       done
}

while [ "$1" != "" ] ; do
	case $1 in
       -a)
              quality_compresion
              ;;
       -b)
              resolution_compression
              ;;
       -c)
              add_watermark
              ;;
       -d)
              rename
              ;;
       -e)
              change
              ;;
       -h) 
              help_file
              ;;
    esac
	shift
done