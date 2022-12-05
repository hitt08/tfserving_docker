FROM tensorflow/serving:2.11.0-gpu

RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
    
RUN /root/miniconda3/bin/conda install -c pytorch faiss-gpu
Run /root/miniconda3/bin/python -m pip install tensorflow
