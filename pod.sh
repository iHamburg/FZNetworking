Project=FZNetworking
VersionString=`grep -E 's.version.*=' ${Project}.podspec`
VersionNumber=`tr -cd '0-9.'<<<"$VersionString"`
# 去除第一个。
NewVersionNumber=${VersionNumber:1}
#echo "current version is ${VersionNumber}, new version is ${Project}"
#
#NewVersionNumber=$(($VersionNumber + 1))
#LineNumber=`grep -nE 's.version.*=' ${Project}.podspec | cut -d : -f1`

#sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" ${Project}.podspec
#git commit -am ${NewVersionNumber}

git tag ${NewVersionNumber}
git push origin master --tags

pod trunk push ${Project}.podspec

