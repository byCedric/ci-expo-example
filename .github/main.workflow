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
  uses = "byCedric/ci-expo@2.2.0"
  args = "publish"
  secrets = [
    "EXPO_CLI_PASSWORD",
    "EXPO_CLI_USERNAME",
  ]
}
