# phpsa-kumu
Docker image based on @jakzal/phpqa that uses the following PHP static analysis tools to analyze Lumen Laravel projects:

 phpcs | [Detects coding standard violations](https://github.com/squizlabs/PHP_CodeSniffer) | &#x2705; | &#x2705; | &#x2705; |

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
docker run -it --rm -e proj=kumu -v "<project_location>:/project" phpsa-kumu
```
