node{
    stage('Git upload'){
        git credentialsId: 'demo', url: 'https://github.com/Prabhu4tx/addressbook'
        
    }
    stage('Maven build'){
        def MavenHome = tool name: 'maven', type: 'maven'
        def mvnCMD = "${MavenHome}/bin/mvn"
        sh "${mvnCMD} clean compile"
        sh "${mvnCMD} package"
        
    }
    stage ('docker build')
    {
      // sh  "docker version"
        sh " sudo docker build -t prabhu4029/myapp2:2.1.21 ."
    }
    stage ('push docker image')
    {
        withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
            sh "sudo docker login -u prabhu4029 -p ${dockerpwd}"
      
}
   sh 'sudo docker push prabhu4029/myapp2:2.1.21'
    }
    stage ('Run tomcatapp'){
    sh 'sudo docker run -p 8080:8080 -d --name myapp1 prabhu4029/myapp2:2.1.21'   
  }
}
