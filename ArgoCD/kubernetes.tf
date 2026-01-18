resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "null_resource" "install_argocd" {
  depends_on = [kubernetes_namespace.argocd]

  provisioner "local-exec" {
    command = "kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
  }
}

resource "null_resource" "apply_service_patch" {
  depends_on = [null_resource.install_argocd]

  provisioner "local-exec" {
    command = "kubectl apply -f argocd-service-patch.yaml"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}