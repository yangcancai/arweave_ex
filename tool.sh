#!/bin/bash
# version:
# rebar 3.16.1 on Erlang/OTP 24 Erts 12.2.1,IEx 1.14.3,Mix 1.14.3
# ar-2.6.7.1

if [ "$#" -gt 0 ] && [ `uname -s`=="Darwin" ]; then
    RANDOMX_JIT="disable randomx_jit"
else
    RANDOMX_JIT=
fi
setup(){
git submodule update --init --recursive
# 1. Fix mac df shell
# 2. replace rebar.config.script
# 3. mix compile
cp rebar.config arweave/apps/arweave/
cp arweave.app.src arweave/apps/arweave/src
mix deps.get
mkdir -p data
cp -r arweave/data/* data/
}
#iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low +Bi " -S mix phx.server
localtest(){
  mkdir -p data_localtest
  cp rebar.config.script_localtest arweave/apps/arweave/rebar.config.script
  mix compile
  export AR_ARGS="$RANDOMX_JIT"
  iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low " -S mix phx.server
}
testnet(){
  cp rebar.config.script_testnet arweave/apps/arweave/rebar.config.script
  mix compile
  export AR_ARGS="$RANDOMX_JIT peer testnet-1.arweave.net peer testnet-2.arweave.net peer testnet-3.arweave.net"
  iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low " -S mix phx.server
}
mainnet(){
  cp rebar.config.script_mainnet arweave/apps/arweave/rebar.config.script
  mix compile
  export AR_ARGS="$RANDOMX_JIT peer 188.166.200.45 peer 188.166.192.169 peer 163.47.11.64 peer 139.59.51.59 peer 138.197.232.192"
  #
  iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low " -S mix phx.server
}
build(){
  if [ "$1"=="mainnet" ]; then
    cp rebar.config.script_mainnet arweave/apps/arweave/rebar.config.script
  elif [ $1=="localtest" ]; then
   cp rebar.config.script_localtest arweave/apps/arweave/rebar.config.script
  else
   cp rebar.config.script_testnet arweave/apps/arweave/rebar.config.script
  fi
  MIX_ENV=prod mix compile
  MIX_ENV=prod mix assets.deploy
  MIX_ENV=prod mix release --overwrite
  mkdir -p arweave_ex
  cp -r _build/prod/rel/arweave_ex/* arweave_ex
  cd arweave_ex
  rm -rf *.gz
  tar -zcf arweave_ex-0.1.0.tar.gz bin data erts-12.2.1 lib releases
  cd ..
}
help(){
  echo "sh tool.sh setup"
  echo "sh tool.sh testnet"
  echo "sh tool.sh localtest"
  echo "sh tool.sh mainnet"
  echo "sh tool.sh build"
}
case $1 in
build) build $2;;
setup) setup;;
testnet) testnet;;
localtest) localtest;;
mainnet) mainnet;;
*) help;;
esac
