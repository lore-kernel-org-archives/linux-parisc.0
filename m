Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8024B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Apr 2001 10:24:29 -0600 (MDT)
Message-Id: <200104181617.KAA19403@puffin.external.hp.com>
To: plaven@ozemail.com.au
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Wed, 18 Apr 2001 21:02:52 +1000."
             <3ADE00FC.9679.982D3D@localhost>
Date: Wed, 18 Apr 2001 10:17:14 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: NFS root setup question
List-ID: <linux-parisc.vger.kernel.org>

"Pete" wrote:
> I have a 715/64 that I'm trying to boot across the network.
...
> The hp box fails with an error on the console (I have a vga screen 
> on the box):
> 
> "ERROR: Cannot load IPL, error detected."
> 
> Since this is my first time with nfsbooting it's likely I'm not doing 
> something right there, ie, I don't have /etc/exports setup.. should I 
> od this?

Yes. But you also need a *lifimage*.

I don't think matching lifimage's (matching the baseplus /boot/vmlinux)
where posted to the ftp site. I've posted a NFSROOT enabled lifimage for
a 32-bit/serial console (not STI enabled):
	ftp://puffin.external.hp.com/pub/parisc/binaries/lifimages/lifimage_32_serial_20010418.gz

Matching Systemp.map and vmlinux are in ../kernels directory.

For the 715's, append 'y' to the "boot lan y" in order to interactively
change the nfsroot= param (IP needs to point to the NFS server).
I don't recall if you need a different vmlinux embedded in the LIF or
if you can interactively tweak the palo boot params to use STI console
instead of serial.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
