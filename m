Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zouave.sonic.net (zouave.sonic.net [209.204.172.153])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CF1F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 15:02:16 -0600 (MDT)
Received: from frizzen.efball.com (frizzen.efball.com [192.168.0.27])
	by zouave.sonic.net (Postfix) with ESMTP id 5B9F966CC
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 14:02:15 -0700 (PDT)
Date: Wed, 6 Jun 2001 14:02:12 -0700
From: E Frank Ball <frankb@efball.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010606140212.A11814@zouave.sonic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] dselect problems
List-ID: <linux-parisc.vger.kernel.org>

I have a 712/80 and a graphics monitor (HP A1097C).  I got the base
system running from the palinux-0.9-32sti.iso CD.

I then tried to run "dpkg-reconfigure base-config".  It got to where it
is supposed to install the packages and died with a message:  failed
running script /usr/sbin/dpkg-preconfigure --apt || true
apt-utils is not installed.

I got apt-utils to install with "apt-get install apt-utils", but now I
can't get anything else to install either with dselect or apt-get.  I
get errors about "couldn't stat source package list cdrom...
- stat (2 no such file or directory).

"which stat" shows nothing.  I don't see a stat package either.
This is my first experience with Debian.

Any clues?, Thanks.

-- 

   E Frank Ball                efball@efball.com
   work: (707) 794-4168        home: (707) 538-3693 
