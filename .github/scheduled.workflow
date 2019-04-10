workflow "Install, Test and Build Web" {
  on = "schedule(0/15 * * * *)"
  resolves = ["Publish"]
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

action "Publish" {
  needs = "Test"
  uses = "bycedric/ci-expo@refactor/simplify"
  args = "build:web"
}
