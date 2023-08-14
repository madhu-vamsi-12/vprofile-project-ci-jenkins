node{
    stage('Get code')
    {
        git credentialsId: '043be7ce-2c09-43b4-b054-765b4ece64a2', url: 'https://github.com/madhu-vamsi-12/vprofile-project-ci-jenkins.git'
    }
    stage('Build package')
    {
        def mavenHome = tool name:"maven-3.8.6", type:"maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    stage('sonarqube analysis')
    {
        withSonarQubeEnv('sonarqube')
        {
            def mavenHome = tool name:"maven-3.8.6", type:"maven"
            def mavenCMD = "${mavenHome}/bin/mvn"
            sh "${mavenCMD} sonar:sonar"
        }
    }
    stage('nexus artifact upload')
    {
        nexusArtifactUploader artifacts: [[artifactId: 'vprofile', classifier: '', file: 'target/vprofile-v2.war', type: 'war']], credentialsId: '4fe41fb3-5557-4d71-ac07-bc5804347ce7', groupId: 'com.visualpathit', nexusUrl: '44.206.251.72:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'vproject-release', version: 'v2'
    }
    stage('Deploy')
    {
        sshagent(['61b73fc9-5863-4d26-bad4-dbadb4821256'])
        {
            sh 'scp -o StrictHostKeyChecking=no target/vprofile-v2.war ec2-user@54.159.222.149:/opt/apache-tomcat-9.0.78/webapps'
        }
    }
}
