resource "docker_image" "sftpgo" {
  name         = "drakkan/sftpgo"
  keep_locally = false
}

resource "docker_container" "sftpgo" {
  image = docker_image.sftpgo.image_id
  name  = "sftpgo-container"
  env = ["SFTPGO_WEBDAVD__BINDINGS__0__PORT=10080", "SFTPGO_WEBDAVD__BINDINGS__0__PREFIX=/webdav"]

  ports {
    internal = 8080
    external = 8083
  }

  ports {
    internal = 10080
    external = 8084
  }

  volumes {
    container_path = "/var/dav"
    read_only = false
    host_path = "/var/dav"
  }
}
