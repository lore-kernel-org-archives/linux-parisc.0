Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA31611
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 11:04:24 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id 6A4D06BF
	for <parisc-linux@thepuffingroup.com>; Fri, 26 Jan 2001 13:08:20 -0500 (EST)
To: LaMont Jones <lamont@security.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lif volume (correct) structs/values 
In-Reply-To: Your message of "Fri, 26 Jan 2001 01:09:19 MST."
             <20010126080919.ABABC22907B@mix.fc.hp.com>
References: <20010126080919.ABABC22907B@mix.fc.hp.com> 
Date: Fri, 26 Jan 2001 11:08:19 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14MDIJ-0006DJ-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Of course, this led to the discover that PALO doesn't create LIF
= images: it creates things that look enough like LIF images to make
= the bootloader happy, but inside they are nothing like a LIF image...
= (Which I'm sure comes as no surprise to most everyone, since the
= objective was never more than that...)
= 
= Should someone want to have PALO create an actual LIF image, that would
= be kind of cool.

I started trying to implement LIF since I was familiar with it from
9000/[234]00 days and I thought it would be cool to be compatible in
some way with HP-format disks.  Then I discovered:

    1) The boot firmware doesn't care that it's boot image is LIF,
    	only that 2 bytes look like LIF.

    2) The boot firmware takes no advantage of LIF -- it uses special
       values stuffed into a magic piece of the LIF header -- which
       requires special code in the LIF tools.  It doesn't even use
       the LIF directory to locate the boot loader on the media.

    3) Wasn't sure LIF format disks could also be DOS-partitioned
       disks.  DOS-partitioned is clunky and old fashioned, but gets
       us ready-made tools, ready-made kernel file-system code, easy
       disk sharing/building with x86, and compatibility with IA64.

Later I learned:

    4) Because our kernel isn't unity-mapped like HP-UX, the HP-UX
       secondary boot loader (ISL aka Mongoose) couldn't load our old
       SOM kernels unless their headers were mangled first.

    5) Mongoose can't load ELF32.  Though a suitable ELF32->SOM converter
       would be fairly easy to write I think, it's more work.

So I feel good about cancelling LIF as our disk and "boot sector" layout.
Where LIF becomes interesting again to me is as a possible compatibility
step for mounting HP-UX-formatted disks.  However I think even there the
critical volume description information is in (proprietary?) tables which
happen to live within LIF space, but at fixed locations so the LIF
is inconsequential and not used by the partition/volume/file-system
code in HP-UX, even to discover the table location.  We could probably
get HP-UX disk compatibility without understanding LIF.

There is an experimental LIF file system for Linux if we want to port it.

	-P
