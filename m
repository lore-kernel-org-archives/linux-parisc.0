Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from droid3.webreklam.hu (para.abs0lut.com [195.56.113.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A6CA482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 09:25:54 -0600 (MDT)
Received: from localhost (diab@localhost)
	by droid3.webreklam.hu (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA13179
	for <parisc-linux@parisc-linux.org>; Sun, 3 Jun 2001 17:25:48 +0200
Date: Sun, 3 Jun 2001 17:25:48 +0200 (CEST)
From: diab <diab@diab.rulez.org>
To: parisc-linux@parisc-linux.org
Subject: RE: [parisc-linux] dead keyboard after booting 0.61 STI32 iso on
 a  715/100
In-Reply-To: <1A8904C3797ED411AC2E0008C7E6F88117C8D0@nlntmail2b.ats.nld.alcatel.nl>
Message-ID: <Pine.LNX.4.21.0106031715530.11894-100000@droid3.webreklam.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

% Just for the record,
% Have identical behaviour with c110, with ps/2 keyboard&mouse.
% Tried 0.6 and 0.6.1, both freezes after the login prompt.....
found the solution :) its pretty dunb though

the problem is that 0.6 and 0.61 gives "console=tty" to the kernel on
boot, instead of "console=tty0" (as in 0.9)

tried to boot 0.61 (used palo to modify console=tty to tty0) and it works
flawlessly. ok lets say i was able to bring up eth0 and nfsmount the 0.9
iso remotely on my linux box. aint got a cd burner here at home so i
should use nfs somehow. 

anyways i found no up2date NFS howtos on the
web, but an old one (2000.02) and somehow the nfsroot=mynfsserverip 
approach seemed to be not working.. gave me stupid read and seek error codes. 

anyways can i use the same lif images/kernels to boot from nfs? i dont
feel like building a cross compiler environment just for this.
if not - if would be nice to provide nfsboot capable kernel images for the
cdless people.

the sti console works fine and everything seems to be ok. this is a
715/100. see if i can copy the 0.9 over and make it working

regards,

--
diab
