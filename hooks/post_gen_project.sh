#!/bin/sh

pipenv install
#python -m ipykernel install --user --name={{ cookiecutter.repo_name }}

git init
git add .
git commit -m "Initial commit"

dvc init
dvc remote add s3 {{ cookiecutter.s3_bucket }}/dvc
dvc config core.remote s3
dvc remote modify s3 profile {{ cookiecutter.aws_profile }}

git add .
git commit -m "Initial dvc commit"
