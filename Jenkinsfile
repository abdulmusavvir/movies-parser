def imageName = 'abdulmusavvirrohe/movies-parser'
node(){
    stage('checkout code'){
        checkout scm
    }
    stage('Quality check'){
        sh "docker build -t ${imageName}-test -f Dockerfile.test ."
        sh "docker run --rm ${imageName}-test golint"
    }
}
