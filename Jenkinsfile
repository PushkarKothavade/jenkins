pipeline {
    agent any 
    parameters {
        string(name: 'ami_id', defaultValue: 'ami-731c2016', description: 'Specify Source AMI ID')
        string(name: 'source_region', defaultValue: 'us-east-2', description: 'Specify source AWS region')
        string(name: 'destination_region', defaultValue: 'us-east-2', description: 'Specify destination AWS region')
        string(name: 'new_image_name', defaultValue: 'Packer_Built_image', description: 'Specify name of the new local AMI')
        string(name: 'key_arn', defaultValue: 'arn:aws:kms:us-east-2:576660391185:key/b1fbead7-05c8-4788-a1e6-f1aa77cb26a0', description: 'Specify AWS key arn')
    }
    stages {
        stage ('clean workspace'){
            steps {
               echo 'Test' 
            }
        }
        stage('Local Image Build') {
            steps {
	        echo 'Build local image from shared Capgemini base image'
		script {
		    sh "chmod a+x build_ami.sh"
		    sh "./build_ami.sh ${params.ami_id} ${params.new_image_name}"
		}
            }
        }
    }
}
