## Devices supported

* Samsung a15 4g - mt6789

## Build Instructions

### Step 1: Setup build environment

The catch: Make sure you have atleast the following minimum specs:

* A 12-thread CPU.
* 16GB of installed RAM.
* A decent amount of disk space (250GB at least). Note that SSDs will build faster than HDDs.
* A decent internet connection to sync source.
* A Linux distro environment (Personally I recommend Ubuntu 24.04 LTS).
* Familiarity with basic shell commands, git and version control.

Lower specs than this could take longer time to build.

To continue setting up the build environment, follow the instructions:

```bash
# Enter Superuser.
sudo su

# Install JDK 
add-apt-repository ppa:openjdk-r/ppa

# Update all packages.
apt-get update

# Install necessary packages.
apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

exit

# Create a bin folder and set up using AkhilNarang Script.

mkdir ~/bin

PATH=~/bin:$PATH

cd ~/bin

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

git clone https://github.com/akhilnarang/scripts.git scripts

cd scripts

bash setup/android_build_env.sh
```

You can refer the AOSP method to do this as well.

https://source.android.com/setup/build/initializing

### Step 2: Sync ROM Source

Go to the ROM's manifest repo (android in case of LineageOS) and follow their instructions to sync the source. Use --depth=1 to shallow clone unless you're doing serious source tweaks and modifications.

Eg:
```
mkdir lineage

cd lineage

repo init -u https://github.com/LineageOS/android.git -b lineage-22.1 --git-lfs --depth=1

repo sync
```
If there occurs any error with checkouts during syncing, just do this once it's finished:
```
repo sync -j1 --fail-fast
```
### Step 3: Sync Device Sources

create '.repo/local_manifests/roomservice.xml

### Step 4: Time to build

Assuming you've done everything right and reached this step, let's proceed.

First we need to include the environment setup.
```
. build/envsetup.sh
```
Now we need to lunch our target.
```
lunch lineage_a15nsxx-eng
```

### Note:

You can enable CCACHE to enable caching and speeding up the build. Here I'm using 50GB for CCACHE.
```
export USE_CCACHE=1 && ccache -M 50G
```
And finally make the ROM!
```
mka bacon -j12
```
You can set different `-j` values depending on how many threads you want to use.

Happy building!!!
