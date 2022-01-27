# phpsa-kumu

## Deployment:
Clone the repository:
```
git clone https://github.com/jnsrdrg/phpsa-kumu.git
```
Build the image:
```
docker build -t phpsa-kumu .
```
Run the container:
```
docker run -it --rm -e proj=<project_name> -v "<project_location>:/project" phpsa-kumu 
```
Sample:
For a Lumen project named "kumu" located in /home/centos/kumu:
```
docker run -it --rm -e proj=kumyu -v "<project_location>:/project" phpsa-kumu
```
