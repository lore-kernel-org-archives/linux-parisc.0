Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30848482A
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 12:53:58 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GOLWLS00.YP6 for
          <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 10:53:52 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-2.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GOLWLS02.K3E for <parisc-linux@parisc-linux.org>; Wed, 19 Dec
          2001 10:53:52 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA01554
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 10:51:41 -0900
Date: Wed, 19 Dec 2001 10:51:41 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112191033240.1400-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] LibC errors on C180 install
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

Interesting - C180, 4G FWSCSI.5, Plextor CD SESCSI.5, 0.93 ISO. On install
I had a segfault in the base-config, which bombed the rest of the install.
Manually added FTP, pulled the latest kernel, reboot and now I can get APT
etc to run, but every time it tries to update libc6 I get an error -
"unable to stat './usr/lib/gconv/CP1251.so' (which I was about to install
): Value too large for defined data type", then libc6 fails to install.

At first I thought the crashing might be FWSCSI related, so I added the
palo parameter (burst:3) to it; somewhere between that and the -pa20
kernel I've cured the segfaults. Is there something I missed in the list
archives about this? Or, since this is a brand-new install, should I just
rerun the install from scratch with some different selection?
