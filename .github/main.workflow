workflow "Publish" {
  on = "push"
  resolves = ["Cargo Publish"]
}

# Filter for a new tag
action "Tag" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "tag"
}

action "Cargo Publish" {
  needs = "Tag"
  uses = "thiagoarrais/action-cargo@master"
  args = "publish"
  secrets = ["CRATES_AUTH_TOKEN"]
}
