Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA11346
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 15:20:13 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id OAA24411
	for <parisc-linux@thepuffingroup.com>; Tue, 24 Aug 1999 14:21:12 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA09713 for <parisc-linux@thepuffingroup.com>; Tue, 24 Aug 1999 14:21:35 -0700 (PDT)
Message-Id: <199908242121.OAA09713@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
In-reply-to: Your message of "Tue, 24 Aug 1999 22:38:15 PDT."
             <19990824223815.E31994@mencheca.ch.genedata.com>
Date: Tue, 24 Aug 1999 14:21:35 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Booting 715/100
List-ID: <linux-parisc.vger.kernel.org>


I finally managed to build a kernel from the 08/07/99 tar file.
Now I can't boot it!

I might need to update the source tree again but need
to figure out how CVS can operate through HP's firewall.


Here's the /etc/bootptab entry:
linuxferris:\
        hd=/linux/linux-2.2.3/arch/parisc/boot:\
        bf=Image:\
        vm=rfc1048:\
        ht=ether:\
        ha=0800097B9230:\
        sm=255.255.248.0:\
        ip=15.16.122.147

Where "/linux/linux-2.2.3" is the kernel source tree.

I also wasn't sure about the difference between
CONFIG_PA7100 and CONFIG_PA7300 in the .config file.
I thought the 715/100 is an older machine before 7300LC
was available and thus is PA7100. Is this right?

"lifls Image" returns
	lifls: Can't list Image; not a LIF volume

Whereas "file Image" says:
	Image:          lif file

<sigh>...can anyone explain this?


Lastly, I've attached the console output.

thanks,
grant


BOOT_ADMIN> inf

System model number: HP 9000/715/100
Processor revision 2.4  100MHz
Instruction Cache Size:  131072
Data Cache Size:         131072
Memory Size:  64 MB
Built in floating point coprocessor
Board Serial Number 40SM891817

BootRom Version    1.6  

auto boot on
auto search on
fastboot on

Primary boot path:    scsi.6.0
Alternate boot path:  lan.000000-000000.0.0
Console path:         graphics_1.1
Keyboard path:        ps2

LAN Station Addresses: 080009-7B9230
                       080009-7B9231


BOOT_ADMIN> sea lan

Searching for potential boot device.
This may take several minutes.

To discontinue, press ESCAPE.

   Device Path              Device Type
   -----------              -----------
   lan.15.16.121.48.3.52                         


BOOT_ADMIN> bo lan.15.16.121.48.3.52
0x06.C740


Attempting to boot.

Loading Initial Program Loader

0x06.8007
0x06.8007
0x06.8007
0x06.8007

ERROR: Cannot load IPL, error detected

0x06.C7F0
Boot process failed. press <ESCAPE> to Continue.
