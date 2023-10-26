source ~/.bashrc
ENV_NAME=qwen
micromamba activate $ENV_NAME
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com
pip install jupyter torch transformers_stream_generator tiktoken accelerate

nohup python setup.py install  > install-flash-attn.log 2>&1 &
#tail -f install.log
nohup pip install csrc/rotary > install-rotary.log 2>&1 &
nohup pip install csrc/layer_norm > install-norm.log 2>&1 &

sudo yum install centos-release-scl
sudo yum install devtoolset-7
scl enable devtoolset-7 bash
micromamba activate $ENV_NAME
micromamba install libgcc
micromamba activate $ENV_NAME
