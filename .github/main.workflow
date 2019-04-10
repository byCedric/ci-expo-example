workflow "Install and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Filter branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Install" {
  needs = "Filter branch"
  uses = "actions/npm@master"
  args = "install"
}

action "Publish" {
  needs = "Install"
  uses = "bycedric/ci-expo@refactor/simplify"
  args = "publish"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}
