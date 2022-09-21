#!/bin/bash
echo "========= PROCESS STARTED ==========="
echo "==================================================="

echo "======= CLEANING BUILD ======="
echo "==================================================="

flutter clean

echo "==================================================="

echo "======= GETTING PACKAGES ======="
echo "==================================================="

flutter pub get

# echo "==================================================="

# echo "======= GENERATING FILES USING BUILD RUNNER ======="
# echo "==================================================="

# flutter pub run build_runner build --delete-conflicting-outputs

echo "==================================================="

PS3='Select platform '
buildTypes=("Web" "Android","Quit")

select type in "${buildTypes[@]}"; do

case $type in 
"Web")
echo "======= BUILDING FOR WEB ======="
echo "==================================================="
flutter build web --web-renderer html  
break;
;;

"Android")
echo "======= BUILDING FOR ANDROID ======="
echo "==================================================="
flutter build apk --release
break;
;;



"Quit")
echo "======= PROCESS TERMINATED ======="
exit
;;

*)
echo "======= INVALID VALUE SELECTED ======="
;;

esac
done

echo "============== PROCESS COMPLETED =================="










