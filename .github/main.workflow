workflow "Install and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Publish" {
  needs = "Install"
  uses = "bycedric/ci-expo@2.1.0"
  args = "publish"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}
