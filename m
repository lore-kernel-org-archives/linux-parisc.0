Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D7994A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Mar 2001 09:27:41 -0700 (MST)
To: "Cory Houston" <chouston@nortelnetworks.com>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: Your message of "Fri, 23 Mar 2001 09:34:10 EST."
             <3ABB5EE2.80C106C7@americasm01.nt.com>
References: <3ABB5EE2.80C106C7@americasm01.nt.com> 
Date: Fri, 23 Mar 2001 09:27:32 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14gUPU-0005i0-00@noam.fc.hp.com>
Subject: [parisc-linux] Re: Linux on a HP 712/60
List-ID: <linux-parisc.vger.kernel.org>

= Hi Paul,
= 
= I just managed to secured a HP 712/60 workstation running a custom HP-UX
= 10.20 image [...] It only has a 1 gig disk, but I was
= planning on using it as a Linux gateway at home. I have to secure a scsi
= cable to hook up a cd-rom drive before I do anything though...

We use network booting most of the time.  That plus a NFS root means
you don't really need a CD to install.  I don't know if the second LAN
card in a 712 is supported yet.

= It appears as though Linux on the hppa architecture is still in its
= infancy.  Can you fill me in if there is a stable version and any
= caveats/gotchas?

Speaking of CDs, the "0.5" CD is pretty moldy though it works OK on
a 712.  Even if you use that CD for user space, you'll want to build a
new kernel.  Instructions are on the web site, www.parisc-linux.org.
FYI the next CD will have some significant changes and we're not planning
a friendly update process, so be sure to save any of your personal
work based on 0.5CD so that you could tolerate a cold install.
I've CC-ed, and you might want to peruse the mailing list archives
and perhaps join the parisc-linux@parisc-linux.org mailing list
(instructions at the web site).

While there are still plenty of gotchas, the number is shrinking and
we can use your help finding and fixing them.  http://bugs.parisc-linux.org
is probably the best place to check for (and report) problems.  If the
second LAN card is supported, I think there's enough to make a decent
gateway already.

	-Paul Bame
