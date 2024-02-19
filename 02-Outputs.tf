output "Link_to_GitHub_repo" {
value = github_repository.foo.html_url
}

output "Url_to_clone_repo" {
value = github_repository.foo.git_clone_url
}
