FROM alpine:3.12

# Install Python and pip
RUN apk add --update py2-pip && \
    pip install --upgrade pip setuptools && \
    apk add --no-cache ca-certificates

# Copy the requirements file
COPY requirements.txt /usr/src/app/

# Install the dependencies
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy the rest of the application files
COPY . /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Run the application
CMD ["python", "app.py"]
