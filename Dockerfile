FROM pytorch/pytorch:nightly-devel-cuda10.0-cudnn7

ENV TERM xterm

RUN apt-get update

RUN apt-get -yq install openssh-server; \
  mkdir -p /var/run/sshd; \
  mkdir /root/.ssh && chmod 700 /root/.ssh; \
  touch /root/.ssh/authorized_keys

RUN pip install pytorch-pretrained-BERT joblib tqdm tensorboardX pandas

COPY bin/* /usr/local/bin/
COPY sshd_config /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["ssh-start"]
CMD ["ssh-server"]



