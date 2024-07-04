FROM alpine:3.12

# Install Python 3 and pip
RUN apk add --update python3 py3-pip && \
    pip3 install --upgrade pip setuptools && \
    apk add --no-cache ca-certificates

# Copy the requirements file
COPY requirements.txt /usr/src/app/

# Install the dependencies
RUN pip3 install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy the rest of the application files
COPY . /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Run the application
CMD ["python3", "app.py"]
