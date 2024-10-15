def imageName = 'abdulmusavvirrohe/movies-parser'

node {
    stage('Checkout Code') {
        checkout scm
    }
    
    stage('Quality Check') {
        // Build the Docker image for testing
        sh "docker build -t ${imageName}-test -f Dockerfile.test ."

        // Run the linter inside the Docker container
        sh "docker run --rm ${imageName}-test golangci-lint run ./..."
    }
}
