#!/bin/bash
# ------------------------------------------------------------------------
#
# Copyright 2005-2015 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
#
# ------------------------------------------------------------------------

# Stop the DSS docker cluster
memberId=1
stopWkaMember() {
	name="wso2dss-${memberId}-wka"
	docker stop ${name}
	memberId=$((memberId + 1))
	echo "DSS wka member stopped: [name] ${name}"
	sleep 1
}

stopMember() {
	name="wso2dss-${memberId}"
	docker stop ${name}
	memberId=$((memberId + 1))
	echo "DSS member stopped: [name] ${name}"
	sleep 1
}

echo "Stopping the DSS docker cluster..."
stopWkaMember
stopMember
stopMember
