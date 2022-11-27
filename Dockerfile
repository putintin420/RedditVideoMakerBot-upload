FROM mcr.microsoft.com/playwright/python:v1.27.0-jammy

RUN apt update

RUN apt install python3-pip -y

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN pip install playwright
RUN python -m playwright install
RUN python -m playwright install-deps

# tricks for pytube : https://github.com/elebumm/RedditVideoMakerBot/issues/142 
# (NOTE : This is no longer useful since pytube was removed from the dependencies)
# RUN sed -i 's/re.compile(r"^\\w+\\W")/re.compile(r"^\\$*\\w+\\W")/' /usr/local/lib/python3.8/dist-packages/pytube/cipher.py

CMD ["python", "--version"]
