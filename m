Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA28104
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 20:47:22 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 62374103
	for <parisc-linux@thepuffingroup.com>; Thu, 24 Feb 2000 18:48:08 -0800 (PST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id SAA04345 for parisc-linux@thepuffingroup.com; Thu, 24 Feb 2000 18:49:27 -0800 (PST)
Date: Thu, 24 Feb 2000 18:49:27 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200002250249.SAA04345@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] nfsroot howto
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
List-ID: <linux-parisc.vger.kernel.org>


Thierry SIMONNET (t.simonnet@esiee.fr) wrote:
| I have a 712/60 Workstation as NFS server and a 712/80 as parisc-linux box. 
| I have some trouble with nfsroot :bootp and tftp process works but 
| IP-Config says : IP-Config : No Network device available. 

Thierry,
I think the problem is you are using HP-UX. :^)
No, really.

I'm pretty sure HP-UX "mknod" creates the special devices *differently*
than parisc-linux wants to interpret them.
HP-UX dev_t is 8 bits Major and 24 bits Minor.
Linux dev_t is 8 bits Major and  8 bits Minor. (according to willy)

Give HP-UX mknod "cooked" parameters in order to create the
special device file linux can use. I might not have cooked
them correctly below....I haven't tried it out yet.

Please try:
o cd /tftpboot/<host>/dev
o rm -f *
o sh mknod.hpux  # appended below

and then try again.

grant


mknod console c 0 0x0501
mknod tty0 c 0 0x0400
mknod tty1 c 0 0x0401
mknod tty2 c 0 0x0402
mknod tty3 c 0 0x0403
mknod tty4 c 0 0x0404
mknod tty5 c 0 0x0405
mknod tty6 c 0 0x0406
mknod tty7 c 0 0x0407
mknod tty8 c 0 0x0408
mknod vcs0 c 0 0x0700
mknod vcs1 c 0 0x0701
mknod vcs2 c 0 0x0702
mknod vcs3 c 0 0x0703
mknod vcs4 c 0 0x0704
mknod vcs5 c 0 0x0705
mknod vcs6 c 0 0x0706
mknod vcs7 c 0 0x0707
mknod vcs8 c 0 0x0708
mknod vcsa c 0 0x0780
mknod vcsa1 c 0 0x0781
mknod vcsa2 c 0 0x0782
mknod vcsa3 c 0 0x0783
mknod vcsa4 c 0 0x0784
mknod vcsa5 c 0 0x0785
mknod vcsa6 c 0 0x0786
mknod vcsa7 c 0 0x0787
mknod vcsa8 c 0 0x0788
 
