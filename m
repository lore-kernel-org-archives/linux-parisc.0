Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B3EE4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 13:05:51 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA10692
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Feb 2001 13:01:36 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A7B1313.C6B5AFFE@uswest.net>
Date: Fri, 02 Feb 2001 13:05:40 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------9EA6EAB9903E413CB976C299"
Subject: [parisc-linux] System bus walk patch
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------9EA6EAB9903E413CB976C299
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello parisc-hackers,

This is the first of a series of patches to impliment an I/O tree for
parsic-linux.  I am
throwing this patch out to the list for discussion, and feedback before
committing it
to CVS because if this patch does not work, it will probably prevent
your machine from
booting. :)

The goal of this first patch is to simply add a system bus walk to the
end of  the firmware
device discovery to add additional devices not reported by the
firmware.  This patch does
not attempt to start organizing the pa_devices into a tree strucuture,
nor walk any other
native bus besides the system bus.  These features will be included in
additional patches,
after this one has been tested and committed to CVS.

I have tested this patch fairly extensively on the C200, but have not
tried it on different
machines. I would be interested in any feedback, concerns, questions
anyone has about
this patch.

Thanks,

- Ryan

--------------9EA6EAB9903E413CB976C299
Content-Type: text/plain; charset=us-ascii;
 name="iotree.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iotree.patch"

--- arch/parisc/kernel/inventory.orig	Fri Feb  2 12:46:00 2001
+++ arch/parisc/kernel/inventory.c	Fri Feb  2 12:37:36 2001
@@ -171,59 +171,88 @@
 }
 #endif /* __LP64__ */
 
+#ifdef __LP64__
+#define FPA 0xFFFFFFFFFFF80000 /* Fixed Physical Address - Location of the Central Bus */
+#else /* !__LP64__ */
+#define FPA 0xFFF80000         /* Fixed Physical Address - Location of the Central Bus */
+#endif /* __LP64__ */
+
+/* The fixed portion is contained in hpa[14..19] for 32 bit and hpa[46..51] for 64 bit.
+** The maximum number of native devices is 2^6 (64) and the offset between devices is
+** 2^12 (0x1000).
+** - Ryan
+*/
+#define MAX_NATIVE_DEVICES 64
+#define NATIVE_DEVICE_OFFSET 0x1000
 
-
-static int do_newer_workstation_inventory(void)
+static int do_native_bus_walk(unsigned long hpa)
 {
-    long status, mod_index, addr_index;
-    struct hp_device *hp_device;
-    int num;
+	int num = 0;
+	struct hp_device *hp_device;
+	unsigned long hpa_end = hpa + (MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET);
+
+	for(; hpa < hpa_end; hpa += NATIVE_DEVICE_OFFSET) {
+		hp_device = alloc_pa_dev(hpa);
+		if (!hp_device)
+			continue;
+		
+		register_pa_dev(hp_device);
+		++num;
+	}
+	return num;
+}
 
-    /* So the idea here is to simply try one SYSTEM_MAP call.  If 
-       that one works, great, otherwise do it another way */
 
-    status = pdc_system_map_find_mods(&module_result, &module_path, 0);
-    if (status != PDC_RET_OK) 
-	return 0;
-    
-    /* This is for newer non-PDC-PAT boxes */
-    printk("a newer box...\n");
-    num = 0;
-    for (mod_index = 0, status = PDC_RET_OK; 
-	 status != PDC_RET_NE_PROC && status != PDC_RET_NE_MOD;
-	 mod_index++) 
-    {
-        status = pdc_system_map_find_mods(&module_result,
-				  &module_path,  mod_index);
+static int do_newer_workstation_inventory(void)
+{
+	long status, mod_index, addr_index;
+	struct hp_device *hp_device;
+	int num;
+	
+	/* So the idea here is to simply try one SYSTEM_MAP call.  If 
+	   that one works, great, otherwise do it another way */
+	
+	status = pdc_system_map_find_mods(&module_result, &module_path, 0);
 	if (status != PDC_RET_OK) 
-	    continue;
-	    
-	hp_device = alloc_pa_dev((unsigned long) module_result.mod_addr);
-	if (!hp_device)
-	    continue;
-	    
-	(void) register_pa_dev(hp_device);
-	num++;
-
-	/* if available, get the additional addresses for a module */
-	if (!module_result.add_addrs) 
-	    continue;
+		return 0;
 	
-	for (addr_index = 1; addr_index <= module_result.add_addrs; addr_index++) {
-	    status = pdc_system_map_find_addrs(
-			&addr_result, mod_index, addr_index);
-			
-	    if (status == PDC_RET_OK)
-		add_pa_dev_addr(hp_device, (unsigned long)addr_result.mod_addr);
-	    else {
-		printk("Bad PDC_FIND_ADDRESS status return (%ld) for index %ld\n",
-		    status, addr_index);
-	        status = PDC_RET_OK; /* reset status for outer loop */
-	    }
-	}
-    } /* end of main loop */
-
-    return (num > 0);
+	/* This is for newer non-PDC-PAT boxes */
+	printk("a newer box...\n");
+	num = 0;
+	for (mod_index = 0, status = PDC_RET_OK; 
+	     status != PDC_RET_NE_PROC && status != PDC_RET_NE_MOD;
+	     mod_index++) {
+		status = pdc_system_map_find_mods(&module_result,
+						  &module_path,  mod_index);
+		if (status != PDC_RET_OK) 
+			continue;
+		
+		hp_device = alloc_pa_dev((unsigned long) module_result.mod_addr);
+		if (!hp_device)
+			continue;
+		
+		(void) register_pa_dev(hp_device);
+		num++;
+		
+		/* if available, get the additional addresses for a module */
+		if (!module_result.add_addrs) 
+			continue;
+		
+		for (addr_index = 1; addr_index <= module_result.add_addrs; addr_index++) {
+			status = pdc_system_map_find_addrs(&addr_result, mod_index, addr_index);
+			if (status == PDC_RET_OK) {
+				add_pa_dev_addr(hp_device, (unsigned long)addr_result.mod_addr);
+			} else {
+				printk("Bad PDC_FIND_ADDRESS status return (%ld) for index %ld\n",
+				       status, addr_index);
+				status = PDC_RET_OK; /* reset status for outer loop */
+			}
+		}
+	} /* end of main loop */
+	
+	/* Walk the system bus */
+	num += do_native_bus_walk(FPA);
+	return (num > 0);
 }
 
 
--- arch/parisc/kernel/drivers.orig	Fri Feb  2 12:46:10 2001
+++ arch/parisc/kernel/drivers.c	Fri Feb  2 12:01:28 2001
@@ -103,15 +103,20 @@
 
 struct hp_device *alloc_pa_dev(unsigned long hpa)
 {
-
+	int i, status;
 	struct hp_device * d;
-	int status;
 
 	d = &pa_devices[num_devices];
 	status = pdc_iodc_read(&pdc_result, (void *)hpa, 0, &iodc_data, 32);
 	if (status != PDC_RET_OK) {
 		/* There is no device here, so we'll skip it */
 		return NULL;
+	}
+
+	/* Check to make sure this device has not already been added -Ryan */
+	for(i = 0; i < num_devices; ++i) {
+		if((unsigned long)pa_devices[i].hpa == hpa)
+			return NULL;
 	}
 
 	d->hw_type = iodc_data[3]&0x1f;

--------------9EA6EAB9903E413CB976C299--
