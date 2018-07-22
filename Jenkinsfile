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
        sh " docker build -t prabhu4029/myapp1:2.1.1 ."
    }
    stage ('push docker image')
    {
        withCredentials([string(credentialsId: 'dockerpass', variable: 'dockerpass')]) {
      sh "docker login -u prabhu4029 -p ${dockerpass}"
      
}
   sh 'docker push prabhu4029/myapp1:2.1.1'
    }
    stage ('Run tomcatapp'){
     def runtomcat = 'docker run -p 8080:8080 -d --name myapp1 prabhu4029/myapp1:2.1.1'
      
        sshagent(['dockerpass1']) {
    sh "ssh -o StrictHostKeyChecking=no prabhu4tx@10.128.0.3 ${runtomcat}"
}
  }
}
