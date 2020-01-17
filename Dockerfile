FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
COPY sources.list /etc/apt/
COPY requirements.txt /opt/

RUN apt-get update \
    && apt-get install -y \
        python3.6 \
        python3-pip \
        libx11-6 \
    && python3.6 -m pip install -r /opt/requirements.txt -i https://repo.huaweicloud.com/repository/pypi/simple  \