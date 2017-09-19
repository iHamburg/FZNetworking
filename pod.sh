
VersionString=`grep -E 's.version.*=' FZNetworking.podspec`
VersionNumber=`tr -cd '0-9'<<<"$VersionString"`
#echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"
NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' FZNetworking.podspec | cut -d : -f1`

sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" FZNetworking.podspec
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
