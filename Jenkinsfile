pipeline {
    agent { label 'BUILD_STATION' }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-devops-proj-file')
        TF_TOKEN_app_terraform_io = credentials('terraform-cloud-token')
        TF_VAR_project_id = "${env.GCP_PROJECT_ID}" 
        TF_BACKEND_FILES_DIR = "backend-configs"
    }

    parameters {
        string(name: 'BACKEND_CONFIG', defaultValue: 'remote-staging.hcl', description: 'Optional: Specify backend config file for Terraform initialization. Example. remote-staging.hcl or gcs-staging.hcl')
        booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to destroy resources instead of applying.')
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    dir("${WORKSPACE}") {
                        // Check if BACKEND_CONFIG is provided, and use it if available
                        if (params.BACKEND_CONFIG) {
                            sh "terraform init -backend-config='${TF_BACKEND_FILES_DIR}/${params.BACKEND_CONFIG}'"
                        } else {
                            sh 'terraform init'
                        }
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    dir("${WORKSPACE}") {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return !params.DESTROY_TERRAFORM }  
            }
            steps {
                script {
                    dir("${WORKSPACE}") {
                        echo "Applying Terraform plan..."
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { return params.DESTROY_TERRAFORM }
            }
            steps {
                script {
                    dir("${WORKSPACE}") {
                        echo "Destroying Terraform resources..."
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
