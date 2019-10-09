# Copyright Waterford Institute of Technology 2017
# Telecommunications Software and Systems Group (TSSG)
# Author Miguel Ponce de Leon <miguelpdl@tssg.org>
#
# Build a container via the example command
#      > make gitaccesstoken="4a5wZhYKuGvd6ZgYL" build
#
# The GitLab access token has to be your own personal access tokens as enabled via Gitlab and outlined in https://docs.gitlab.com/ce/user/profile/personal_access_tokens.html
# The gitaccesstoken="4a5wZhYKuGvd6ZgYL" in this example will not work.
#
# Need to ensure the Docker daemon is running before the build will run

all:: build

build: ## Must add your own GitLab username (gituseraccess="sam") and access token (gitaccesstoken="4a5wZhYKuGvd6ZgYL") as part of build arguments

ifeq (${gituseraccess},)
		@echo "There is no Git access username or token set to run this build"
		@echo "For a GitLab access token read https://docs.gitlab.com/ce/user/profile/personal_access_tokens.html"
		@echo "Re-run the make command with your username and access token. For example like"
		@echo "> make gituseraccess="sam" gitaccesstoken="4a5wZhYKuGvd6ZgYL" build"
else
		@echo "Running the Docker build"
	  @docker build --rm -t reserve/libiec61850 --build-arg gituser=${gituseraccess} --build-arg access_token=${gitaccesstoken} .
endif
