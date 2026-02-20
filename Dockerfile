# -------------------------------
# ARG → build-time variable
# -------------------------------
ARG NGINX_VERSION=latest

# -------------------------------
# FROM → base image
# -------------------------------
FROM nginx:${NGINX_VERSION}

# -------------------------------
# LABEL → metadata
# -------------------------------
LABEL maintainer="Soheb Pathan"
LABEL app="nginx-web-app"
LABEL version="1.0"
LABEL description="Custom Nginx Docker Image"

# -------------------------------
# ENV → runtime environment variables
# -------------------------------
ENV APP_HOME=/usr/share/nginx/html
ENV APP_ENV=production

# -------------------------------
# WORKDIR → set working directory
# -------------------------------
WORKDIR $APP_HOME

# -------------------------------
# COPY → copy web files
# -------------------------------
COPY index.html .

# -------------------------------
# RUN → execute build command
# -------------------------------
RUN echo "Docker image built successfully for $APP_ENV"

# -------------------------------
# VOLUME → persistent storage
# -------------------------------
VOLUME ["/usr/share/nginx/html"]

# -------------------------------
# EXPOSE → expose port
# -------------------------------
EXPOSE 80

# -------------------------------
# HEALTHCHECK → container health check
# -------------------------------
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
CMD curl -f http://localhost || exit 1

# -------------------------------
# ENTRYPOINT → main process
# -------------------------------
ENTRYPOINT ["nginx"]

# -------------------------------
# CMD → default arguments
# -------------------------------
CMD ["-g", "daemon off;"]
