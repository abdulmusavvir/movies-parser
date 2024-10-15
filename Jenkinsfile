def imageName = 'abdulmusavvirrohe/movies-parser'

node {
    stage('Checkout Code') {
        checkout scm
    }
    
    stage('Quality Test') {
        // Build the Docker image for testing
        sh "docker build -t ${imageName}-test -f Dockerfile.test ."

        // Run the linter inside the Docker container
        sh "docker run --rm ${imageName}-test golint"
    }
    stage ('Unit test'){
        sh "docker run --rm ${imageName}-test go test"
    }
}
