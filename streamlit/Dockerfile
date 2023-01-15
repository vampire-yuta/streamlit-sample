FROM python:3.11-bullseye

RUN apt-get -y update
RUN pip install streamlit pyodbc

# EXPOSE 8501

# WORKDIR /app
# WORKDIR /streamlit
COPY ./app.py /streamlit/
COPY ./mssql.py /streamlit/
COPY ./.streamlit/secrets.toml /.streamlit/secrets.toml
COPY ./requirements.txt /


RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
  && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
  && apt-get -y update \
  && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
  && ACCEPT_EULA=Y apt-get install -y mssql-tools18 \
  && echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc \
  && apt-get install -y unixodbc-dev \
  && apt-get install -y libgssapi-krb5-2

RUN pip3 install -r /requirements.txt

# ENTRYPOINT ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
