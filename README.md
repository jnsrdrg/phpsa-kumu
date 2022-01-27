# phpsa-kumu
Docker image based on [jakzal/phpqa](https://github.com/jakzal/phpqa) that uses the following PHP static analysis tools to analyze Lumen Laravel projects:

- phpcs | [Detects coding standard violations](https://github.com/squizlabs/PHP_CodeSniffer)
- parallel-lint | [Checks PHP file syntax](https://github.com/JakubOnderka/PHP-Parallel-Lint)
- phpstan | [Static Analysis Tool](https://github.com/phpstan/phpstan)
- local-php-security-checker | [Checks composer dependencies for known security vulnerabilities](https://github.com/fabpot/local-php-security-checker)
- phpcpd | [Copy/Paste Detector](https://github.com/sebastianbergmann/phpcpd)

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
