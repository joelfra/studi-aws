
Scripts Cloudformation pour approvisioner un S3 + Cloudfront

Scripts Terraform pour approvisioner une instance EC2 et une base de données RDS

tree
├── Cloudformation S3
│   ├── S3.yaml             :  S3
│   └── cloudfront.yaml     :  Cloudfront 
│
|── terraform EC2 - RDS
│   ├── alb.tf              : table de route, internet gateway
│   ├── ec2.tf              : instances ec2
│   ├── main.tf             : instance RDS
│   ├── outputs.tf          : RDS endpoint
│   ├── security-group.tf   : groupe de sécurité EC2 + RDS
│   ├── vars.tf             : variables
│   └── vpc.tf              : sous réseau (subnet)


Pour lancer les scripts terraform :
 terraform init
 terraform plan
 terraform validate
 terraform apply

Pour supprimer les scripts terraform:
 terraform destroy
