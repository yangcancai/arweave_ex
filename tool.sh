#!/bin/bash
# version:
# rebar 3.16.1 on Erlang/OTP 24 Erts 12.2.1,IEx 1.14.3,Mix 1.14.3
# ar-2.6.7.1

if [ $# -gt 0 ] && [ `uname -s` == "Darwin" ]; then
    RANDOMX_JIT="disable randomx_jit"
else
    RANDOMX_JIT=
fi
setup(){
git submodule update --init --recursive
# 1. Fix rebar3
mix local.rebar rebar3 ./rebar3
# 2. Fix mac df shell
# 3. replace rebar.config.script
# 4. mix compile
mix compile
# 5. cp priv or data
cp arweave/_build/default/lib/arweave/priv/* _build/dev/lib/arweave/priv/
cp -r arweave/data data
}
#iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low +Bi " -S mix phx.server
testnet(){
  cp rebar.config.script_testnet arweave/rebar.config.script
  mix compile
  export AR_ARGS="$RANDOMX_JIT peer testnet-1.arweave.net peer testnet-2.arweave.net peer testnet-3.arweave.net"
  iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low " -S mix phx.server
}
mainnet(){
  cp rebar.config.script_mainnet arweave/rebar.config.script
  mix compile
  export AR_ARGS="$RANDOMX_JIT peer 188.166.200.45 peer 188.166.192.169 peer 163.47.11.64 peer 139.59.51.59 peer 138.197.232.192"
  iex --erl "+MBas aobf +MBlmbcs 512 +Ktrue +A20 +SDio20 +sbwtvery_long +sbwtdcpuvery_long +sbwtdiovery_long +swtvery_low +swtdcpuvery_low +swtdiovery_low " -S mix phx.server
}
help(){
  echo "sh tool.sh setup"
  echo "sh tool.sh testnet"
  echo "sh tool.sh mainnet"
}
case $1 in
setup) setup;;
testnet) testnet;;
mainnet) mainnet;;
*) help;;
esac