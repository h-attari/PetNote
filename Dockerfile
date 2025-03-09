FROM python:3.6

# Install supervisor
RUN apt-get update && \
    apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install wheel && \
    pip install -r requirements.txt

# Copy supervisord.conf to the configurations
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8000

CMD ["/usr/bin/supervisord"]