docker run -d -p 22 -v ${WORKSPACE-`pwd`}:/var/www/$(basename `pwd`) $IMAGE_NAME /bin/echo hello
