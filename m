Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04651
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 19:34:32 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id 357BD22EAD
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Jan 2001 21:38:06 -0500 (EST)
Date: Thu, 11 Jan 2001 21:37:34 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010111213734.D134330@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/80 problem
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've been testing and building and following the newest developments
with the PARISC port of linux.  However, I've hit a small snag with my
NFS/rbootd/bootp/tftp server.  I have two machines, a 735 and a 755,
that both boot without problem from the linux server.  using the same
kernel, and same config, I can't get a 715/80 to boot from the server.
However, I have built a working CD image of the kernel and stuff, and
my cd boots just fine.  The CD is using the CVS kernel from 20010109,
and the last cd contents from the palinux-0.5.iso cd image, with updated
vmlinux and iplboot.  unfortunatly, I've not had any luck at making my
newly aquired 715/80 to boot from this machine.  I did add it to the
bootptab, rbootd.conf, /etc/hosts, /etc/exports, and others that I don't
remeber right this minute.  My problem is that on the 715, it either
fails to load IPL or something dies trying to load IPL.  For the 735 and
755 I've been using the lifimage created under the palo source, for the
kernel that the systems load and boot.  Is there any other files as such
that a 715 needs that a 735 doesn't?  I've also noticed that the 735 and
755 require rbootd for netowrk boot, but the 715 looked as though it
didn't.  Does a 715 need extra options for bootp to work?  does it need
to load iplboot instead of lifimage?

I looked through the faq, but didn' see this question.

Great Job so far though, the STI console works well on the 715/80
through my cd that I created with your instructions.  However, the STI
looks a little odd on the 735 and 755, ie: some characters are not
displayed right yet...

Thanks,
-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
