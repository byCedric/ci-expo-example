workflow "Install and Publish" {
  on = "push"
  resolves = [
    "Publish",
    "bycedric/ci-expo",
  ]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Test" {
  needs = "Install"
  uses = "actions/npm@master"
  args = "test"
}

action "Filter branch" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Publish" {
  needs = "Filter branch"
  uses = "bycedric/ci-expo@master"
  args = "publish"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
}

action "bycedric/ci-expo" {
  uses = "bycedric/ci-expo@master"
  needs = ["Filter branch"]
  args = "build:web"
}
