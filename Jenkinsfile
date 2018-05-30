pipeline {
    agent any 
    parameters {
        string(name: 'ami_id', description: 'Specify Source AMI ID')
        string(name: 'source_region', defaultValue: 'us-east-2', description: 'Specify source AWS region')
        string(name: 'destination_region', defaultValue: 'us-east-2', description: 'Specify destination AWS region')
        string(name: 'new_image_name', defaultValue: 'Packer_Built_image', description: 'Specify name of the new local AMI')
        string(name: 'key_arn', description: 'Specify AWS key arn')
    }
    stages {
        stage('Local Image Build') {
            steps {
	        echo 'Build local image from shared Capgemini base image'
	        sh '''
		    packer build -var '${params.ami_id}' -var '${params.new_image_name}' foo.json 
	        '''
            }
        }
    }
}
