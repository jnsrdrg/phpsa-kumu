# phpsa-kumu

## Deployment:

Build the image:
```
docker build -t phpsa-kumu .
```

Run the container:
```
docker run -it --rm -e proj=<project_name> -v "<project_location>:/project" phpsa-kumu 
```
