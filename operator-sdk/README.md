# Operator-sdk
You can obtain the Operator SDK source code to compile and install the SDK CLI. 
```shell script
mkdir -p $GOPATH/src/github.com/operator-framework
cd $GOPATH/src/github.com/operator-framework
git clone https://github.com/operator-framework/operator-sdk
cd operator-sdk
# Check out the desired release branch:
git checkout master

# Compile and install the SDK CLI:
make install
# This installs the CLI binary operator-sdk at $GOPATH/bin.

# Verify that the CLI tool was installed correctly:
operator-sdk version
```
