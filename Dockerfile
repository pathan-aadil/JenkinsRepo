FROM python:3.9.19=slim
RUN pip install streamlit 
WORKDIR /var
COPY app.py .
CMD ["streamlit","run","app.py"]