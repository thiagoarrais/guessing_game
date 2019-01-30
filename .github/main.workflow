workflow "Publish" {
  on = "push"
  resolves = ["Cargo Publish"]
}

action "Cargo Publish" {
  uses = "thiagoarrais/action-cargo@master"
  args = "publish"
  secrets = ["CRATES_AUTH_TOKEN"]
}
