### Download the latest version of datetime.rsc from GitHub and install it.
{
    :local scriptContents ([/tool fetch url="https://raw.githubusercontent.com/m4rc377/datetime-routeros/master/install-datetime.rsc" as-value output=user]->"data")
    :if ([/system script find name="create-datetime-function"] != "") do={
        /system script remove create-datetime-function
    }
    /system script add name="create-datetime-function" policy=read,policy,write,test source=$scriptContents
    :if ([/system scheduler find name="create-datetime-function"] != "") do={
        /system scheduler remove create-datetime-function
    }
    /system scheduler add name=create-datetime-function on-event="/system script run create-datetime-function" policy=read start-time=startup
}
