Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA23548
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Sep 1999 01:16:51 -0600
From: ext-helge.deller@nokia.com
Message-ID: <A914533BF4B9D2118D980008C7894C0A01013169@dueis01nok>
To: parisc-linux@thepuffingroup.com
Subject: FW: [parisc-linux] Finally ... Kernel Booted on C200
Date: Thu, 9 Sep 1999 10:18:31 +0300 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>



-----Original Message-----
From: Deller Helge (EXT-NEG/Dusseldorf) 
Sent: Donnerstag, 9. September 1999 9:17
To: 'EXT Ryan Bradetich'
Subject: RE: [parisc-linux] Finally ... Kernel Booted on C200



Yes, but it's really easy with two steps:

1. make vmlinux
2. make Image	(<- Here the ipl will be built & stripped, then ipl and
vmlinux will be added to the file "Image").
3. Boot the file arch/parisc/boot/Image from HDD or via network.


Helge Deller.


> -----Original Message-----
> From: EXT Ryan Bradetich [mailto:rbradetich@uswest.net]
> Sent: Donnerstag, 9. September 1999 5:33
> To: Parisc Linux
> Subject: [parisc-linux] Finally ... Kernel Booted on C200
> 
> 
> Well I'm slowly learning .... :)
> 
> I finally figured out how to compile the cvs tree into a kernel that
> I could boot on the C200.
> These are the steps I followed, will someone verify if they 
> are correct?
> 
> 1. built the kernel using vmlinux,
> 2. built the ipl in arch/parisc/boot/boot_code
> 3. stripped ipl
> 4. mkImage ipl vmlinux vmlinux.boot
> 5 boot off of vmlinux.boot
> 
> At this point I get Tranfering control to kernel.  (At entry point
> 0x00010000)
> The LED are also flashing in some patteren.
> 
> Well, time to start researching signals :)
> 
> -Ryan
> 
> 
> 
> --------------------------------------------------------------
> -------------
> To unsubscribe: send e-mail to 
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
