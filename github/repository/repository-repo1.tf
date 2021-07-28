module "create-core-go" {
  source     = "./module-create-repository"
  repository = "core-go"
  description = "custom discription."

  iserver-custom-labels = {
  
      "tips" = {
        "description" = "This is a if you have any quick tip"
        "color"       = "cfd3d7"
        

        }
        "tips2" = {
        "description" = "This is a if you have any quick tip"
        "color"       = "cfd3d7"
        

        }
  }

}
