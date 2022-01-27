#!/bin/bash

######PARALLEL-LINT#####
parallel-lint $proj | tee parallel-lint.log #Save the output to a file

parallel_lint_error=`cat parallel-lint.log | grep "Syntax error found in" | cut -d " " -f 5` #Number of errors for the Parallel-lint scan

if [[ $parallel_lint_error == "" ]]; then
  parallel_lint_error=0;
fi
echo "The total number of error using parallel-lint is $parallel_lint_error"


####PHPSTAN####
phpstan analyse $proj | tee phpstan.log

phpstan_error=`cat phpstan.log | grep "ERROR" | cut -d " " -f 4` #Number of errors for the phpstan_error scan

if [[ $phpstan_error == "" ]]; then
  phpstan_error=0;
fi

echo "The total number of error using phpstan is $phpstan_error"

####PHPCPS####
phpcs $proj | tee phpcs.log

phpcs_error=`cat phpcs.log | grep FOUND | cut -d " " -f 2 ` #Number of errors for the phpcs scan

phpcs_total_error=0

for i in $phpcs_error
do
    phpcs_total_error=$(( $phpcs_total_error + $i ))
done
echo "The total number of error using phpcs is $phpcs_total_error"


####PHPCPD####
phpcpd $proj | tee phpcpd.log


######LOCAL-PHP-SECURITY-CHECKER####
cd $proj && local-php-security-checker . > local-php-security-checker.log

local_php_security_checker_error=`cat local-php-security-checker.log | grep "packages have known vulnerabilities" | cut -d " " -f 1 ` #Number of errors for the local_php scan




#######SUMMARY#######
echo "The total number of error using parallel-lint is $parallel_lint_error"
echo "The total number of error using phpstan is $phpstan_error"
echo "The total number of error using phpcs is $phpcs_total_error"

re='^[0-9]+$' #REGEX EXPRESSION VARIABLE FOR DETECTING INTEGERS
if [[ $local_php_security_checker_error =~ $re ]]; then
   echo "Number of Packages with known vulnerabilities: $local_php_security_checker_error"
else
  echo "Number of Packages with known vulnerabilities: 0"
fi

total_error=$(( $parallel_lint_error + $phpstan_error + $phpcs_total_error ))
echo "The total number of errors using parallel-lint, phpstan, and phpcps is $total_error"



