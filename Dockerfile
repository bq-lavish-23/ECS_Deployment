FROM python:3.9-alpine
WORKDIR /app
COPY . . ./
#RUN pip3 install -r requirements.txt
#RUN python3 setup.py install FLASK_APP=hello flask run
#ENTRYPOINT ["cd","hello"]
#ENTRYPOINT ["python","setup.py","install","FLASK_APP=__init__.py","flask","run"]
RUN pip3 install -r requirements.txt
EXPOSE 5000
ENV MESSAGE="hello world"
RUN python setup.py install
ENV FLASK_APP=hello
ENTRYPOINT ["python3","api.py"]
