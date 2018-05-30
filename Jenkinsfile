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
		    packer build -var-file=foo_variables.json foo.json 
	        '''
            }
        }
        stage('Image with Encrypted Volumes') {
            steps {
	        echo 'Create Image with encrypted volumes'
	        sh '''
		    aws ec2 copy-image --source-region ${params.ami_id} 
	        '''
            }
        }
    }
}
