Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr2.cc.ic.ac.uk (mr2.cc.ic.ac.uk [155.198.5.112])
	by dsl2.external.hp.com (Postfix) with ESMTP id 461504829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 15:14:25 -0700 (MST)
Received: from icex12.cc.ic.ac.uk ([155.198.3.12])
	by mr2.cc.ic.ac.uk with esmtp (Exim 3.35 #1)
	id 18BjIa-0003Ct-02
	for parisc-linux@lists.parisc-linux.org; Tue, 12 Nov 2002 22:14:20 +0000
Date: Tue, 12 Nov 2002 22:11:41 +0000
From: no one <neverbefound@subdimension.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20021112221141.2d2792f0.neverbefound@subdimension.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Newbie found an hp 712-80 :)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello,

Sorry for asking these rather simple questions, but I've spent an evening reading all the documentation that I could find on the parisc sites, and am still a little be unsure.

Yesterday I realised that the cute little box sitting by the bin for 3 weeks was actually a computer - a hp 712-80 to be precise; and I am now desperate (after failing to hear the psu fan above the fridge) to run linux on it, eventually headless (if I dare to reset the default console thingy...) as a network server or as a lightweight webbrowser (i.e. dillo).

It came with no floppy, no harddrive, and no memory - I've bought a el-cheapo 2nd hand generic 2Gb SCSI drive; and now need to squeeze linux onto it :)

As soon as I find myself some simms, I'll be able to get past the pretty hardware-failure screen (look! it even draws where the failing/missing part is on the motherboard!) and have the following installation method planned out.

1) Setup dhcpd on my slackware box to serve the 'lifimage' for the latest net-boot iso
2) Lan-Boot the 712 with a crossover-cable into the main computer, via dhpcd
(don't want to confuse true lan dhpcd requests...)
3) This lifimage will load a kernel and a initrd with the standard debian install tools.
4) I could now 'ifconfig eth0 down', plug the hp into the actual lan, bring the net connection back up (dhcp or static lan config...)
5) Do a install from my closest debian mirror.

I'm sure there must be a fatal flaw in there somewhere... after reading through all those fearful references to NFS-roots et al., it seems so simple now that I've written it down :)

Also, I read somewhere that you can flash the latest firmware to the machine by serving it the firmware as a net-boot image - is this correct? Would it be safer by some other method? - for instance (no idea of actual possibility), copy the firmware to /boot & get AILO (sic?) to boot it...

Thankyou for your patience, ;)
When I get this all set up I promise to write a 'basic 712 install' walkthrough... :)

Jarvist
