# Dockerfile :
#     nanoserver-for-service.c

Arg imageVersion="latest"

Arg installer=servercore-for-service.c:${imageVersion}

# For the image nanoserver-for-service.c :
# nanoserver-for-service.c

# Building image..

From ${installer} as servercore

From nanoserver.c:${imageVersion}

Label maintainer="Autumn Chiang <autumn.snoopy@hotmail.com>"
Label package.Monitor.version="2.0.1.3"
Label package.Monitor.pkg.digests="FF31018FA20D"
Label package.Monitor.pkg.description="Monitor monitors Windows Service for container environment."

# installing..
# installing package Monitor..
#Arg package_Monitor_name="Monitor"
#Arg package_Monitor_version="Latest"
Arg package_Monitor_installdir="C:/Windows"
    # get archive..
    Copy --from=servercore ${package_Monitor_installdir}/Monitor.exe ${package_Monitor_installdir}/

# Configuring image..

Onbuild Entrypoint ["C:/Windows/Monitor.exe"]