resource "github_repository" "foo" {
  name      = "repo-test5-s"
  auto_init = true
}

resource "github_repository_file" "tf_files" {
  for_each            = fileset("C:/Users/adria/OneDrive/Desktop/terraform_cliv/AWS/saopowpow/ultraman66", "/*.tf")
  repository          = github_repository.foo.name
  branch              = "main"
  file                = each.value#".gitignore"
  content             = file("C:/Users/adria/OneDrive/Desktop/terraform_cliv/AWS/saopowpow/ultraman66/${each.key}")
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_branch" "branch_name"{
  repository = github_repository.foo.name
  branch = "development"
}