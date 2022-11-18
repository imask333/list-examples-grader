# Create your grading script here

set -e

rm -rf newDirectory
rm -rf student-submission

git clone $1 student-submission


if [[ -e student-submission/ListExamples.java ]]
then 
    echo $?
else
    echo "failed"
    exit 1
fi

javac -cp $CPATH *.java 2>compError.txt
touch TestListExamples
mv TestListExamples/student-submission/

if [[$? -eq 0]]
then 
    echo "compile"
else
    echo "not commplie"
    exit 1
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > codeError.txt

javac -cp $CPATH *.java 2>compError.txt
