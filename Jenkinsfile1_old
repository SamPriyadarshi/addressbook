node {
   def mvnHome
   def version 
   stage('Preparation') {

      git 'https://github.com/Prabhu4tx/addressbook.git'
      mvnHome = tool 'maven'
	  version = '3.5.3' 
   }
	
   stage('Build') {
        withMaven(
        maven: 'maven', // Maven installation declared in the Jenkins "Global Tool Configuration"
        //mavenSettingsConfig: 'settings.xml', // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        mavenLocalRepo: '.repository') {
	//	configFileProvider(
        //[configFile(fileId: 'maven-settings', variable: 'MAVEN_SETTINGS')]) {
        sh 'mvn -s $MAVEN_SETTINGS clean package'
  //  }

      if (isUnix()) {
        // sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore test -Pfunctional-test -DSkipUTs=true -DskipTests=true"
	   sh "'${mvnHome}/bin/mvn' clean install "
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore test -Pfunctional-test -DSkipUTs=true -DskipTests=true/)

      git 'https://github.com/Prabhu4tx/addressbook.git'
      mvnHome = tool 'LOCAL_MAVEN'
	  version = '3.5.3' 
   }
   stage('Perform-UnitTest') {
        withMaven(
        maven: 'maven', // Maven installation declared in the Jenkins "Global Tool Configuration"
        //mavenSettingsConfig: 'settings.xml', // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        mavenLocalRepo: '/home/user') {

      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn'  clean test "
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean test/)

      }
    } // withMaven will discover the generated Maven artifacts, JUnit reports and FindBugs reports
    

   }
//<<<<<<< HEAD
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }
     stage('DeployToServer') {
	 } 
} 
//=======
   stage('PublishResults') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }

   stage('notify') { 
	   echo "user"
   } 
} 
//>>>>>>> c618cbe7fefbbff7a5530f00ef38639b7f80756d
}
