Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA25548
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 16:52:37 -0600
Received: from rascal.fc.hp.com (rascal.fc.hp.com [15.2.72.2])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id SAA03143
	for <parisc-linux@thepuffingroup.com>; Wed, 9 Jun 1999 18:52:26 -0400 (EDT)
Message-Id: <199906092252.QAA06166@rascal.fc.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: tor@spacetec.no (Tor Arntsen), parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to get HP-UX working 
In-reply-to: Your message of "Wed, 09 Jun 1999 22:43:14 MDT."
             <E10rq7u-0000km-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 09 Jun 1999 16:52:29 -0600
From: Matt Taggart <taggart@rascal.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan Cox writes...

 >I can't however get HP/UX to set up an interface 
 >
 >	194.168.151.23 netmask 255.255.255.224

Are you getting errors or do you just need to know where to make changes? 
If it's the former, post the errors and maybe someone can help. If its the 
latter, you probably want to edit /etc/rc.config.d/netconf

 >which I really need to do. Also before I go and build all the sane tools
 >so the box is usable has anyone already built a big tar file of HP/UX 
binaries
 >of gcc/bash/fileutils etc ?

I think it would be nice for all the developers to be sync'ed up and using 
the latest tools. Right?

Does it make sense to go one step further and package them in either HP's 
SD depot format or alternatively RPM(and provide RPM on HP-UX)? I have some 
SD experience and could automate the packaging if needed.

Another, somewhat larger, option would be to produce a custom HP-UX image 
for the people working on the port. We can slap that image on bootable CDs 
for distribution. Rebuilding a system from one of these CD's only takes 
about 20 minutes. The image could be rebuilt fairly easily if it needed to 
be updated.  I can also help with this if needed.

What does everyone think?

Thanks,

--
Matt Taggart       Technical Consulting Lab
taggart@fc.hp.com  Workstation Systems Division
Ft Collins, CO     Hewlett Packard
