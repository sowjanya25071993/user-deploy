pipeline{
    agent{
        node{
            label 'Agent-1'
        }
    }
    options{
        timeout(time:1,unit:'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters{
        string(name:'version', defaultValue:'', description:'what is ur artifact version?')
        string(name:'environment', defaultValue:'', description:'what is the environment?')
    }
    stages{
        stage('print version'){
            steps{
                sh"""
                 echo "version:${params.version}"
                 echo "environment:${params.environment}"
                 """
            }
        }
        stage('init'){
            steps{
                sh"""
                 cd terraform
                 terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('plan'){
            steps{
                sh"""
                 cd terraform 
                 terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                 """
                }  
        }
        stage('apply'){
            steps{
                sh"""
                 cd terraform
                 terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                 """
                }
            }
    }

post{
        always{
            echo "i will always say hello again"
            deleteDir()
        }
        success{
            echo "i will always say hello when pipeline is success"
        }
        failure{
            echo "this is when pipeline failed"
        }
    }
}