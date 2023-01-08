FROM tensorflow/serving:2.11.0-gpu

RUN curl https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh --output Miniconda3-py38_4.12.0-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-py38_4.12.0-Linux-x86_64.sh -b \
    && rm -f Miniconda3-py38_4.12.0-Linux-x86_64.sh 

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/miniconda3/lib

RUN /root/miniconda3/bin/conda install -c pytorch faiss-gpu

COPY requirements.txt /tmp
Run /root/miniconda3/bin/python -m pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt
RUN /root/miniconda3/bin/python -m pip install -U torch --no-cache-dir
