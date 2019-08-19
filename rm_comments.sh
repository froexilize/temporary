#!/bin/sh

cp $1 $2 -r
cd $2
rm -rf cmake-build-*/
rm -rf build/
for i in $(find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp");
do
	gcc -fpreprocessed -dD -E -P "$i" -w > "$i.bak"
	mv $i.bak $i
	astyle --style=java $i
done

