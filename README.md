[![Build Status](https://travis-ci.org/Piousbox-cookbooks/ish_vm.svg?branch=0.1.1)](https://travis-ci.org/Piousbox-cookbooks/ish_vm)


Intro
=====

ish_vm Cookbook

Manage VirtualBox on laptop.

Recipes
=======

default
-------
Does nothing.

hostname
--------
Sets the hostname according to what's in data bag utils/sites.json

The data bag looks like this
```
{
    "id": "sites",
    "description": "This is for serverspec in 20160106.",
    "sites": [
	{
	    "id": "some-id",
	    "domains": [ "hostname" ],
	    "ipaddress": "10.0.xx.xx"
	},
	...
    ]
}
```

Such that the hostname of the node having that ip (on any interface) becomes that domain.
