Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90014482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 12:32:37 -0700 (MST)
Date: Thu, 15 Nov 2001 12:32:03 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011115123203.A2337@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] 64bit kernels boot on C200 (finally) :)
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

Hello parisc-linux hackers,

I just wanted to throw out a quick note because I've been
waiting for this day for a long time now.... today is the
first day (granted I have not tried recently) the C200+
boot a 64-bit kernel!!

It is not perfect yet, still have a couple of bugs to work
out and fix:
	1. sys32_ioctl: Unknown cmd fd(3) cmd(00004b50) arg(faf00788)
	2. the ncr720 driver seemed to hang when I had a disk
	   attached behind the bluefish card.

but here it is:

demo@vega:~$ uname -a
Linux vega 2.4.14-pa1 #2 Thu Nov 15 12:08:07 MST 2001 parisc64 unknown

- Ryan

P.S. Remember for the C200+ (if someone else wants to play with this,
you need to enable the 32-bit PDC wrappers.).
