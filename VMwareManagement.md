## Get-VMHostNetworks ##
```

NAME
    Get-VMHostNetworks
    
SYNOPSIS
    Return a list of networks from a given host
    
SYNTAX
    Get-VMHostNetworks [[-VMHost] <String>] [[-VIServer] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    After connecting to your VI server, we get a list of virtual switches on the datacenter and fro
    m
    that we pull out the VHostID that matches the server we passed in at the command-line. Using th
    e
    VHostID we return a list of networks objects on that server.
    

PARAMETERS
    -VMHost <String>
        The name of the VMWare Host Server to pull networks from
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -VIServer <String>
        The name of your VSPhere Server
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This script requires the VMware vSphere PowerCLI to be downloaded and installed, please see
        the second link for the download.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-VMHostNetworks -VMHost v1.copmany.com -VIServer vc.company.com
    
    
    Name                      Key                            VLanId PortBinding NumPorts
    ----                      ---                            ------ ----------- --------
    Management Network        key-vim.host.PortGroup-Mana... 0
    DMZ Network               key-vim.host.PortGroup-DMZ ... 100
    Admin Network             key-vim.host.PortGroup-Admi... 101
    
    Description
    -----------
    This shows the output from the command using all parameters.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/VMWareManagement#Get-VMHostNetworks
     http://communities.vmware.com/community/vmtn/server/vsphere/automationtools/powercli
     http://www.vmware.com/support/developer/PowerCLI/PowerCLI41U1/html/Connect-VIServer.html
     http://www.vmware.com/support/developer/PowerCLI/PowerCLI41U1/html/Get-VirtualSwitch.html
     http://www.vmware.com/support/developer/PowerCLI/PowerCLI41U1/html/Get-VirtualPortGroup.html



```