Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04.mail.mel.aone.net.au (mta04.mail.au.uu.net [203.2.192.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 062E2482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Apr 2001 05:03:05 -0600 (MDT)
Received: from piglet.sspl.net.au ([210.84.112.25])
          by mta04.mail.mel.aone.net.au with ESMTP
          id <20010418110256.MONM316.mta04.mail.mel.aone.net.au@piglet.sspl.net.au>
          for <parisc-linux@lists.parisc-linux.org>;
          Wed, 18 Apr 2001 21:02:56 +1000
Received: from winnie.sspl.net.au (barbar@winnie. [192.168.10.9])
	by piglet.sspl.net.au (8.9.3/8.9.3) with ESMTP id VAA11341
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Apr 2001 21:02:51 +1000
From: "Pete" <plaven@ozemail.com.au>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 18 Apr 2001 21:02:52 +1000
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Reply-To: plaven@ozemail.com.au
Message-ID: <3ADE00FC.9679.982D3D@localhost>
Subject: [parisc-linux] dumb question of the day
List-ID: <linux-parisc.vger.kernel.org>

Hi everyone,

I have a 715/64 that I'm trying to boot across the network.

I grabbed the latest base tar ball from the ftp server and 
uncompressed it. 

I grabbed rboot and set it up and didn't work, so I have set bootps 
and tftp according to the howto at http://www.oswg.org/oswg-
nightly/oswg/en_US.ISO_8859-1/articles/parisc-linux/parisc-linux-
boot.html  (very helpful too I might add)

from boot_admin I boot lan, I have tcpdump listening on eth1 where 
the hppa box is connected via aui/TP and UTP cross over.  I can 
see the broadcast and /var/log/messages shows that tftp is looking 
for iplboot, as copied from the tar ball boot dir.

The hp box fails with an error on the console (I have a vga screen 
on the box):

"ERROR: Cannot load IPL, error detected."

Since this is my first time with nfsbooting it's likely I'm not doing 
something right there, ie, I don't have /etc/exports setup.. should I 
od this?

Please, some short pointers for a dummy.. :)  I _so_ want to IRC 
on this box!!  :)

Thanks.

Pete.
