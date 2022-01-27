FROM jakzal/phpqa

ADD entrypoint.sh .

WORKDIR /project

ENTRYPOINT ["/bin/bash","entrypoint.sh"]
