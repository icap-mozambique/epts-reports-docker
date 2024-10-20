ARG PYTHON_VERSION=3.13.0
FROM python:${PYTHON_VERSION}-slim AS base

LABEL maintainer="steliomo@gmail.com" 

VOLUME [ "/opt/epts-reports/data" ]

WORKDIR /opt/epts-reports/data/epts-reports-ao/integ

ENV PYTHONPATH="/opt/epts-reports/data/epts-reports-ao"

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

RUN python -m pip install "fastapi[standard]"
RUN python -m pip install dhis2.py
RUN python -m pip install pandas
RUN python -m pip install python-multipart

# Expose the port that the application listens on.
EXPOSE 8000

# Run the application.
CMD python3 -m fastapi run app.py