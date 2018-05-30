pipeline {
    agent any 
    parameters {
        string(name: 'ami_id', description: 'Credentials')
        string(name: 'source_region', defaultValue: 'us-east-2', description: 'AWS region')
        string(name: 'destination_region', defaultValue: 'us-east-2', description: 'AWS region')
        string(name: 'new_image_name', defaultValue: 'Packer_Built_image', description: 'Name of the local AMI')
        string(name: 'key_arn', description: 'AWS key arn')
    }
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
