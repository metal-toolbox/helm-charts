git clone https://github.com/metal-toolbox/fleet-scheduler
NAME=$(yq -r .name ./fleet-scheduler/chart/Chart.yaml)
VERSION=0.0.1



mkdir -p ./${NAME}/tempchart
cp -r ./${NAME}/chart/* ./${NAME}/tempchart/
rm ./${NAME}/tempchart/Chart.yaml
sed -e "s/1.0.1/${VERSION}/g" ./${NAME}/chart/Chart.yaml > ./${NAME}/tempchart/Chart.yaml
helm package ./${NAME}/tempchart
helm repo index --url https://github.com/metal-toolbox/helm-charts .
rm -rf ./fleet-scheduler
# git add . && git commit -m “publish ${NAME}-${VERSION}.tgz” && git push origin gh-pages