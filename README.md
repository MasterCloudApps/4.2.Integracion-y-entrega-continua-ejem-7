# Ejemplo 7 - Custom runners

Este proyecto consta de un servidor REST sencillo para la gestión de items y cuenta con un workflow de GitHub Actions para la ejecución de sus test.


Para ejecutar el runner puede lanzarse tal y como se indica en Settings > Actions > Runners o mediante Docker:

Construimos la imagen base
```bash
docker build --tag gh-runner:base .
```

Construimos la imagen específica para Maven
```bash
docker build --tag gh-runner:maven -f maven-runner.Dockerfile .
```

Lanzamos el runner como un contenedor
```bash
docker run -d --env REPO=MasterCloudApps/4.2.Integracion-y-entrega-continua-ejem-7 \
   --env TOKEN=<TOKEN> \
   --env LABELS=mca-runner \
   --name maven-runner gh-runner:maven
```



