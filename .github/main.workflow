workflow "New workflow" {
  on = "push"
  resolves = ["Expo Publish"]
}

action "Install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "ci"
}

action "Test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Install"]
}

action "Expo Login" {
  uses = "bycedric/ci-expo/login@2.0.0"
  needs = ["Test"]
  secrets = ["EXPO_PASSWORD", "EXPO_USERNAME"]
}

action "Expo Publish" {
  uses = "bycedric/ci-expo/publish@2.0.0"
  needs = ["Expo Login"]
}
