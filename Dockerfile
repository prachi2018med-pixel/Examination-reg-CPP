FROM ubuntu:22.04
RUN apt-get update && apt-get install -y gcc libsqlite3-dev
WORKDIR /app
COPY . .
# Compile
RUN gcc main.c mongoose.c -o exam_app -lsqlite3 -lpthread -lm
EXPOSE 18080
# Use the exact same name as above
CMD ["./exam_app"]