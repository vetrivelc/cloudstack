# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
class VirtualMachine(CloudStackEntity):

    def restore(self, apiclient, virtualmachineid, **kwargs):
        pass

    def deploy(self, apiclient, zoneid, serviceofferingid, templateid, **kwargs):
        pass

    def migrate(self, apiclient, virtualmachineid, **kwargs):
        pass

    def list(self, apiclient, **kwargs):
        pass

    def stop(self, apiclient, id, **kwargs):
        pass

    def reboot(self, apiclient, id, **kwargs):
        pass

    def update(self, apiclient, id, **kwargs):
        pass

    def start(self, apiclient, id, **kwargs):
        pass

    def destroy(self, apiclient, id, **kwargs):
        pass

    def assign(self, apiclient, account, domainid, virtualmachineid, **kwargs):
        pass