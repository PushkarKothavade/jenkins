pipeline {
    agent any 
    parameters {
        string(name: 'ami_id', defaultValue: 'ami-0ecba948fcbe67cd8', description: 'Specify Source AMI ID')
        string(name: 'source_region', defaultValue: 'us-east-2', description: 'Specify source AWS region')
        string(name: 'destination_region', defaultValue: 'us-east-2', description: 'Specify destination AWS region')
        string(name: 'new_image_name', defaultValue: 'Packer_Built_image', description: 'Specify name of the new local AMI')
        string(name: 'key_arn', defaultValue: 'arn:aws:kms:us-east-2:576660391185:key/b1fbead7-05c8-4788-a1e6-f1aa77cb26a0', description: 'Specify AWS key arn')
    }
    stages {
        stage ('clean workspace'){
            steps {
                deleteDir()
            }
        }
        stage('Local Image Build') {
            steps {
	        echo 'Build local image from shared Capgemini base image'
	        sh '''
                    #!/bin/bash
		    packer build -var '"'"'var_source_ami=params.ami_id'"'"' -var '"'"'var_ami_name=params.new_image_name'"'"' foo.json
	        '''
            }
        }
    }
}
