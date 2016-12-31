#AVIP

## Summary
AVIP is a lightweight ruby gem for geolocation of ip addresses. The gem is a wrapper built around ipinfo.io. 
## Installation
Fairly standard stuff
```
gem install av-ip
````
## Usage
To initialize an instance of the geolocation tool, simply call
```
locater = AVIP.new()
```
The default instance is localhost, '127.0.0.1', yielding every output parameter. If you are unsure about settings it is best to leave the default parameters.

Post initialization, you may pass the locater paramters in hash format. 
Example:
```
locater.update({:content => [:ip, :city, :region], :ip => '127.0.0.1
'})
```

To recieve the data, simply call
```
locater.search 
	#=> {:ip => '127.0.0.1', :city => 'timbucktoo', :region => 'basement land'}
```
By default, search looks for the ip stored in the options, but simply adding any ip parameter to search will work such as
```
locater.search('123.45.67.89')
```
The following output parameters are:
```
:ip,
:hostname,
:city,
:region,
:country,
:loc,
:org,
:postal
```
##Notes
This should be used with caution in its current state as it uses eval to parse the string.
