// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
package com.cloud.api.commands;

import org.apache.cloudstack.api.response.ZoneResponse;
import org.apache.log4j.Logger;

import org.apache.cloudstack.api.ApiConstants;
import org.apache.cloudstack.api.BaseCmd;
import org.apache.cloudstack.api.Implementation;
import org.apache.cloudstack.api.Parameter;
import org.apache.cloudstack.api.ServerApiException;
import com.cloud.exception.InvalidParameterValueException;
import com.cloud.host.Host;
import com.cloud.network.NetworkUsageManager;
import com.cloud.server.ManagementService;
import com.cloud.server.api.response.ExternalFirewallResponse;
import com.cloud.server.api.response.TrafficMonitorResponse;
import com.cloud.user.Account;
import com.cloud.utils.component.ComponentLocator;
import com.cloud.utils.exception.CloudRuntimeException;

@Implementation(description="Adds Traffic Monitor Host for Direct Network Usage", responseObject = ExternalFirewallResponse.class)
public class AddTrafficMonitorCmd extends BaseCmd {
	public static final Logger s_logger = Logger.getLogger(AddTrafficMonitorCmd.class.getName());	
	private static final String s_name = "addtrafficmonitorresponse";	
	
	/////////////////////////////////////////////////////
    //////////////// API parameters /////////////////////
    /////////////////////////////////////////////////////
	
	@Parameter(name=ApiConstants.ZONE_ID, type=CommandType.UUID, entityType = ZoneResponse.class,
            required = true, description="Zone in which to add the external firewall appliance.")
	private Long zoneId;
	
	@Parameter(name=ApiConstants.URL, type=CommandType.STRING, required = true, description="URL of the traffic monitor Host")
	private String url;	 

	@Parameter(name=ApiConstants.INCL_ZONES, type=CommandType.STRING, description="Traffic going into the listed zones will be metered")
	private String inclZones;	 
	
	@Parameter(name=ApiConstants.EXCL_ZONES, type=CommandType.STRING, description="Traffic going into the listed zones will not be metered")
	private String exclZones;	 
	
	///////////////////////////////////////////////////
	/////////////////// Accessors ///////////////////////
	/////////////////////////////////////////////////////
	 
	public String getInclZones() {
		return inclZones;
	}
	
	public String getExclZones() {
		return exclZones;
	}

	public Long getZoneId() {
	    return zoneId;
	}

	public String getUrl() {
		return url;
	}
	
	/////////////////////////////////////////////////////
	/////////////// API Implementation///////////////////
	/////////////////////////////////////////////////////

	@Override
	public String getCommandName() {
		return s_name;
	}
	
	@Override
    public long getEntityOwnerId() {
        return Account.ACCOUNT_ID_SYSTEM;
    }
	 
	@Override
    public void execute(){
		try {
		    ComponentLocator locator = ComponentLocator.getLocator(ManagementService.Name);
		    NetworkUsageManager networkUsageMgr = locator.getManager(NetworkUsageManager.class);
			Host trafficMoinitor = networkUsageMgr.addTrafficMonitor(this);
			TrafficMonitorResponse response = networkUsageMgr.getApiResponse(trafficMoinitor);
			response.setObjectName("trafficmonitor");
			response.setResponseName(getCommandName());
			this.setResponseObject(response);
		} catch (InvalidParameterValueException ipve) {
			throw new ServerApiException(BaseCmd.PARAM_ERROR, ipve.getMessage());
		} catch (CloudRuntimeException cre) {
			throw new ServerApiException(BaseCmd.INTERNAL_ERROR, cre.getMessage());
		}
    }
}

