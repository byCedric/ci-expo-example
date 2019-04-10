workflow "Install and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Filter branch" {
  needs = "Install"
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Publish" {
  needs = "Filter branch"
  uses = "bycedric/ci-expo@refactor/simplify"
  args = "publish"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}
