Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id E85634842
	for <parisc-linux@parisc-linux.org>; Wed, 26 Dec 2001 22:03:58 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GOZKQG00.HBT for
          <parisc-linux@parisc-linux.org>; Wed, 26 Dec 2001 20:03:52 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-2.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GOZKQH02.93B for <parisc-linux@parisc-linux.org>; Wed, 26 Dec
          2001 20:03:53 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA03315
	for <parisc-linux@parisc-linux.org>; Wed, 26 Dec 2001 20:01:07 -0900
Date: Wed, 26 Dec 2001 20:01:07 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112261956090.3248-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Oops...
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

Perhaps I spoke too soon about -pa24 being good. After compiling and
rebooting with -pa24, then an apt-get update/dist-upgrade, make no longer
works. Ran a cvs update to -pa27, which had no effect, of course... All I
get is a pause with "_ESCOA", then either a segfault or "Trace/breakpoint
trap" (random).

Any ideas how to troubleshoot this one? I can always reboot to the 2.4.9
kernel, then try to recompile with -pa27, but if I can drag a little info
out of this I'm more than happy to do so.

Everything else appears to work fine...
