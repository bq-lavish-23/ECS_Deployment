FROM python:3.9-alpine
WORKDIR /app
COPY . . ./
#RUN pip3 install -r requirements.txt
#RUN python3 setup.py install FLASK_APP=hello flask run
ENTRYPOINT ["python","setup.py","install","FLASK_APP=hello","flask","run"]
