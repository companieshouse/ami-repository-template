variable "ami_account_ids" {
  description = "A list of account IDs that have access to launch the resulting AMI(s)"
  type        = list(string)
}

variable "ami_name_prefix" {
  default     = "unnamed"
  description = "The prefix string that will be used for the name tags of the resulting AMI and snapshot(s); the version string will be appended automatically"
  type        = string
}

variable "aws_instance_type" {
  default     = "t3.small"
  description = "The EC2 instance type used when building the AMI"
  type        = string
}

variable "aws_region" {
  default     = "eu-west-2"
  description = "The AWS region in which the AMI will be built"
  type        = string
}

variable "aws_source_ami_filter_name" {
  default     = "amzn2-base-*"
  description = "The source AMI filter string. Any filter described by the DescribeImages API documentation is valid. If multiple images match then the latest will be used"
  type        = string
}

variable "aws_source_ami_owner_id" {
  description = "The source AMI owner ID; used in combination with aws_source_ami_filter_name to filter for matching source AMIs"
  type        = string
}

variable "aws_subnet_filter_name" {
  description = "The subnet filter string. Any filter described by the DescribeSubnets API documentation is valid. If multiple subnets match then the one with the most IPv4 addresses free will be used"
  type        = string
}

variable "configuration_group" {
  default     = "unnamed"
  description = "The name of the group to which to add the instance for configuration purposes"
  type        = string
}

variable "data_volume_iops" {
  default     = 3000
  description = "The baseline IOPS for the data EBS volume; 3000 is the gp3 default"
  type        = number
}

variable "data_volume_size_gib" {
  description = "The EC2 instance data volume size in Gibibytes (GiB)"
  type        = number
}

variable "data_volume_throughput" {
  default     = 125
  description = "The throughput, in MiB/s, for the data EBS volume; 125 is the gp3 default"
  type        = number
}

variable "force_delete_snapshot" {
  default     = false
  description = "Delete snapshots associated with AMIs, which have been deregistered by force_deregister"
  type        = bool
}

variable "force_deregister" {
  default     = false
  description = "Deregister an existing AMI if one with the same name already exists"
  type        = bool
}

variable "kms_key_id" {
  default     = "alias/packer-builders-kms"
  description = "The KMS key ID or alias to use when encrypting the AMI EBS volumes; defaults to the AWS managed key if empty"
  type        = string
}

variable "playbook_file_path" {
  default     = "../ansible/playbook.yml"
  description = "The relative path to the Ansible playbook file"
  type        = string
}

variable "root_volume_iops" {
  default     = 3000
  description = "The baseline IOPS for the root EBS volume; 3000 is the gp3 default"
  type        = number
}

variable "root_volume_size_gb" {
  default     = 20
  description = "The EC2 instance root volume size in Gibibytes (GiB)"
  type        = number
}

variable "root_volume_throughput" {
  default     = 125
  description = "The throughput, in MiB/s, for the root EBS volume; 125 is the gp3 default"
  type        = number
}

variable "ssh_clear_authorized_keys" {
  default     = true
  description = "Defines whether the authorized_keys file should be cleared, post-build"
  type        = bool
}

variable "ssh_private_key_file" {
  default     = "/home/packer/.ssh/packer-builder"
  description = "The path to the common Packer builder private SSH key"
  type        = string
}

variable "ssh_username" {
  default     = "ec2-user"
  description = "The username Packer will use when connecting with SSH"
  type        = string
}

variable "version" {
  type        = string
  description = "The semantic version number for the AMI; the version string will be appended automatically to the name tags added to the resulting AMI and snapshot(s)"
}
