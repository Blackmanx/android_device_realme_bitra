echo "Applying Brightness patch"

cd frameworks/base || exit 1
git fetch https://review.arrowos.net/ArrowOS/android_frameworks_base refs/changes/88/17688/1 && git cherry-pick FETCH_HEAD
cd ../..
