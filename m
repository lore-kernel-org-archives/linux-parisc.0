Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02BA04A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 15:16:15 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31772
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 15:12:06 -0700
From: 5116@telia.com
Message-Id: <200102012215.XAA10570@zaphod.halden.lillfab.se>
Date: Thu, 1 Feb 2001 23:15:57 +0100 (CET)
Reply-To: 5116@telia.com
Subject: Re: [parisc-linux] register_fallback_cpu() 
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200102010541.VAA00554@milano.cup.hp.com>
MIME-Version: 1.0
Content-Type: MULTIPART/mixed; BOUNDARY="-1463811727-1804289383-981065757=:6612"
List-ID: <linux-parisc.vger.kernel.org>

---1463811727-1804289383-981065757=:6612
Content-Type: TEXT/plain; CHARSET=US-ASCII

On 31 Jan, Grant Grundler wrote:

.... And the patch... 

/Daniel
-- 


---1463811727-1804289383-981065757=:6612
Content-Type: TEXT/plain; CHARSET=US-ASCII
Content-Disposition: attachment ; filename="boot-fail.diff"

Index: arch/parisc/kernel/drivers.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/drivers.c,v
retrieving revision 1.10
diff -r1.10 drivers.c
54,76c54,81
< 
< 	/* link driver to the head of the global list.
< 	** The list gets built in reverse order...ideally, it shouldn't
< 	** matter but reality will eventually rear it's ugly head.
< 	*/
< 	driver->next = pa_drivers;
< 	pa_drivers = driver;
< 
< 	for (i=0; i < num_devices; i++) {
< 		device = &pa_devices[i];
< 
< 		if (device->managed)			continue;
< 		if (0 == compare_spec(device, driver))	continue;
< 
< 		if ( (*driver->callback)(device,driver) ==0) {
< 			device->managed=1;
< 		} else {
< 			printk("Warning : device (%d, 0x%x, 0x%x, 0x%x, 0x%x) NOT claimed by %s %s\n",
< 				device->hw_type,
< 				device->hversion, device->hversion_rev,
< 				device->sversion, device->sversion_rev,
< 				driver->name, driver->version);
< 		}
---
>         
>         while(0!=driver->hw_type) {
> 	   
> 	       /* link driver to the head of the global list.
> 	       ** The list gets built in reverse order...ideally, it shouldn't
> 	       ** matter but reality will eventually rear it's ugly head.
> 	       */
> 	       driver->next = pa_drivers;
> 	       pa_drivers = driver;
>         
>     
> 	       for (i=0; i < num_devices; i++) {
> 	        	device = &pa_devices[i];
> 
> 		       if (device->managed)			continue;
> 		       if (0 == compare_spec(device, driver))	continue;
> 
> 		       if ( (*driver->callback)(device,driver) ==0) {
> 			         device->managed=1;
> 		       } else {
> 			         printk("Warning : device (%d, 0x%x, 0x%x, 0x%x, 0x%x) NOT claimed by %s %s\n",
> 				        device->hw_type,
> 				        device->hversion, device->hversion_rev,
> 					device->sversion, device->sversion_rev,
> 					driver->name, driver->version);
> 		       }
> 	       }
> 	       driver++;

---1463811727-1804289383-981065757=:6612--
