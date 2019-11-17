# Copyright 2019 The Angao Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BIN_DIR=_output/bin

# If tag not explicitly set in users default to the git sha.
TAG ?= ${shell (git describe --tags --abbrev=14 | sed "s/-g\([0-9a-f]\{14\}\)$/+\1/") 2>/dev/null || git rev-parse --verify --short HEAD}

.EXPORT_ALL_VARIABLES:

all: scheduler

init:
	mkdir -p ${BIN_DIR}

scheduler: init
	go build -o=${BIN_DIR}/scheduler-framework-sample ./cmd/scheduler

scheduler-linux: init
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o=${BIN_DIR}/scheduler-framework-sample ./cmd/scheduler

image: scheduler-linux
	docker build --no-cache . -t scheduler-framework-sample:$(TAG)

update:
	dep ensure -update -v

clean:
	rm -rf _output/
	rm -f *.log
