// REFERENCE: https://wiki.genral73.cloud/display/PLAYBOOK/Jenkins+Pipeline
library 'genral73-lib@v0.4.0'
tamkeenLib.runPipeline(
    imagesToBuild: [
        [
            imageName: 'docker.artifacts.genral73.cloud/erp/odoo-saas',
            dockerfileDirectory: './',
            updateTagInYaml: [
                filePath: 'PlansDirectory/odoo-saas.yaml' ,
                 keyPath: 'image.tag' 
                 ]
        ]
    ],
    configurationRepository: [
        URL: 'https://code.genral73.cloud/scm/saserp/plans-config.git' ,
        productionReleaseTag: 'production-release' 
            ],
    slackChannelName: 'erp-test-ci'

)
