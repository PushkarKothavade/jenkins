pipeline {
    agent any 
    stages {
        stage('Local Image Build') {
            steps {
	        echo 'Build local image from shared Capgemini base image'
	        sh '''
		    packer build -var-file=foo_variables.json foo.json 
	        '''
            }
        }
    }
}
