git pull origin deploy-test
docker stop ihm_dunya && docker rm ihm_dunya && docker rmi dunya/ihm
docker build -f Dockerfile -t dunya/ihm .
docker run -p 4200:4200 --name ihm_dunya --restart always -d dunya/ihm
