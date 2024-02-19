## GitOps for Terraform Repos

## 1. Create GitHub Repo
##    And Git init (auto)
resource "github_repository" "repo" {
  name      = "put_name_of_your_repo_here"
  auto_init = true
}

## 2. Add Terraform files to GitHub repo
##    Commit and Push files to repo
resource "github_repository_file" "tf_files" {
  for_each            = fileset("Copy+paste_full_path_to_your_terraform_folder_here", "/*.tf")
  repository          = github_repository.repo.name
  branch              = "main"
  file                = each.value
  content             = file("Copy+paste_full_path_to_your_terraform_folder_here/${each.value}")
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

##3.  Add a branch to your GitHub repo
resource "github_branch" "branch_name"{
  repository = github_repository.repo.name
  branch = "development"
}
