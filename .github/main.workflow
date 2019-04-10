workflow "Install and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Install" {
  uses = "actions/npm@1.0.0"
  args = "install"
}

action "Publish" {
  needs = "Install"
  uses = "byCedric/ci-expo@2.1.0"
  args = "publish"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}
