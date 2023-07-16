# Aliases
# alias alias_name="command_to_run"

# Long format list
alias ll="ls -la"

# Print my public IP
alias myip='curl ipinfo.io/ip'

alias cpaetest="k8cfg ae-test cp-ae-test-eks-2 default"
alias cpketest="k8cfg ke-test cp-ke-test-eks-3 default"
alias cpaeacc="k8cfg ae-acc cp-ae-acc-eks-2 default"
alias cpkeacc="k8cfg ke-acc cp-ke-acc-eks-3 default"
alias cpngacc="k8cfg ng-acc cp-ng-acc-eks-3 default"
alias cpaeuat="k8cfg ae-uat cp-ae-uat-eks-2 default"
alias cpkeprod="k8cfg ke-prod cp-ke-prod-eks-3 default"
alias cpngprod="k8cfg ng-prod cp-ng-prod-eks-3 default"

function k8cfg() {
  export AWS_SDK_LOAD_CONFIG=1
  export AWS_PROFILE=$1
  AWS_PAGER="" aws sts get-caller-identity || aws sso login
  aws eks update-kubeconfig --name $2 --alias $2
  kubectl config set-context --current --namespace=$3
}
