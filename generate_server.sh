export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
go install github.com/cloudwego/thriftgo@latest
kitex --version
thriftgo --version

go install github.com/cloudwego/hertz/cmd/hz@latest

cd ./rpc-server
kitex -module "github.com/TikTokTechImmersion/assignment_demo_2023/rpc-server" -service imservice ../idl_rpc.thrift
cp -r ./kitex_gen ../http-server

go install github.com/golang/protobuf/protoc-gen-go@latest
protoc --go_out=./http-server/proto_gen/api --go_opt=paths=source_relative ./idl_http.proto

