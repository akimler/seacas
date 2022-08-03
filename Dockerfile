FROM ubuntu:latest
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        autoconf automake cmake git libx11-dev wget -y
RUN git clone --depth 1 https://github.com/sandialabs/seacas.git
RUN cd seacas/ && \
    ./install-tpl.sh && \
    cd ../
RUN cd seacas/ && \
    mkdir build && \
    cd build && \
    ../cmake-config && \
    make && \
    make install && \
    cd ../../
RUN python -m pip install numpy
ENV PYTHONPATH "${PYTHONPATH}:/seacas/lib/"
CMD ["/bin/bash"]
