metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:zRMXLeW6NusrG8UxCzJsPhkzxAIGJvOPDG5oLG2PsjU="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:zRMXLeW6NusrG8UxCzJsPhkzxAIGJvOPDG5oLG2PsjU="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:zRMXLeW6NusrG8UxCzJsPhkzxAIGJvOPDG5oLG2PsjU="
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:hKsVLjNo0HTHkNN+cfOTrLjTwNWU/Rwp2Wk0Vkvzsrc="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:NAkp8sJX2zhJmquozVJyWrSQjYnb6jNK9Euugk8TFhI="
  retries = 2
  verbose = false
}
