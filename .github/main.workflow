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
  uses = "expo/expo-github-action@master"
  args = "publish"
  secrets = [
    "EXPO_CLI_PASSWORD",
    "EXPO_CLI_USERNAME",
  ]
}
