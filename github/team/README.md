
Module Test


1. first clone the repository 

``` 
https://github.com/iserver/org-terraform-modules.git
```

2. once you cloned. it have below strecture 

```
repository
team
issue-github.py
mirror-repo.sh

5 days ago
```


3.  create repository. 

now go in repository folder 

```
cd repository
```


Important files to notice .

Tempalte files : 

- repository-repo-template.tf 
- secure-repo-template.tf


Test Scnerio : 


first created a file called ```repository-repo1.tf```

```
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
```




here we need to give two informations only : 

```
repository =  "provide your repository name here "
discription = "provide the discription you wants to give to repository."

```



then you need to run below commands to create repository. 
this will create  repository on server.


```
terraform init
terraform plan
terraform apply
```



still it just repository. 


now we need to migrate repository. 

to two it we are going to perform two scripts here. 

in root of our project we got 

```
miror-repo.sh
```

this script will clone all the current repository content 

this script ask you the destination repository and source repository. 
it clones the conent including branches and tags. 

but this script can't clone 

issues
comments 
milestones 


to achive this i have created another python script 

```
issue-migration.py
```

to execute the script it required some perameters. 

lets 


```
python issue-migration.py githubusername github-access-token source-repository destination-repository
```


this script will copye issues, comments, milesones, labels. 
once its copied it check the milesones and labels and assign to repository accordingly. 



once its done 

then we need to secure the repositoy. 

to do it  we need to go in repository directory. 

```
cd repository 
```


here is you can find a file called 

```
secure-repo-template.tf
```

this file will secure the repository. 


lets replicate the template file. 

```
cp secure-repo-template.tf.  secure-repo1.tf
```

you need to give a new name here in the beginning of module. preffer repo name. 

```
module "secure-core-go" {
```


remove comment from file and  provide the repositoy name 


```
repository = "give the repository name here"
```



once done  then apply terraform 


```
terraform  plan 
terraform apply 
```


