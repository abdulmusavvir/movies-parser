// def imageName = 'abdulmusavvirrohe/movies-parser'

// node {
//     stage('Checkout Code') {
//         checkout scm
//     }
    
//     stage('Quality Test') {
//         // Build the Docker image for testing
//         sh "docker build -t ${imageName}-test -f Dockerfile.test ."

//         // Run the linter inside the Docker container
//         sh "docker run --rm ${imageName}-test golint"
//     }
//     stage ('Unit test'){
//         sh "docker run --rm ${imageName}-test go test"
//     }
//     stage ('Security Test'){
//         sh "docker run -u root:root nancy /go/src/github/mlabouardy/movies-parser/Gopkg.lock"
//     }
// }



def imageName = 'abdulmusavvirrohe/movies-parser'

node {
    stage('Checkout Code') {
        checkout scm
    }

    def ImageTest = docker.build("${imageName}-test", "-f Dockerfile.test .")

    stage('Preintegration Test') {

        parallel(
            'Quality Test':{
             ImageTest.inside(){
                sh 'golint'
             }   
            },
            'Unit Test':{
              ImageTest.inside(){
                sh 'go test'
            }
            },
            'Security Test':{
                ImageTest.inside('-u root:root'){
                    sh 'nancy Gopkg.lock'

                }
            }
        )
    }
}
