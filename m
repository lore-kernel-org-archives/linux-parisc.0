Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3A6D483C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 23:36:48 -0600 (MDT)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Cc: varenet@esiee.fr, grundler@cup.hp.com
Content-Type: text/plain
Date: 10 Jun 2002 23:36:46 -0600
Message-Id: <1023773807.7353.19.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
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


I have heard of SMP hangs on the A500 from the ESIEE and Grant's system,
so I installed the 2.4.18-pa35 on a dual processor J200 and tried to
duplicate the hangs and hopefully provide a different perspective on the
hang.

The good and bad news is that I can duplicate the process hangs on the 
J200 by simply running two instances of the setiathome program.

Digging into the system a bit, here is what I found:

	* The setiathome process that hung (PID 326) will hang any other
	  process that tries to access /proc/326/*.  (This is why top,
	  ps, etc all hang after the process gets stuck).

	* None of the other processes appear to be stuck. (ie. I can 
	  access the /proc/PID/* information and the command will 	  return).

	* The processes that hang while trying to read from the stuck 
	  process go into a disk sleep and never return.

		This is the a "hung" process that access the stuck 		process.

		# cat status 
		Name:	ps
		State:	D (disk sleep)
		Tgid:	1362
		Pid:	1362
		PPid:	1359
		TracerPid:	0
		Uid:	0	0	0	0
		Gid:	0	0	0	0
		FDSize:	256
		Groups:	0 
		VmSize:	    3032 kB
		VmLck:	       0 kB
		VmRSS:	     880 kB
		VmData:	    1136 kB
		VmStk:	       0 kB
		VmExe:	      68 kB
		VmLib:	    1420 kB
		SigPnd:	0000000000000000
		SigBlk:	0000000000000000
		SigIgn:	8000000000000000
		SigCgt:	000000007f2ffef9
		CapInh:	0000000000000000
		CapPrm:	00000000fffffeff
		CapEff:	00000000fffffeff


It appears that the stuck process also affected my serial console login,
so I am not able to gather more information using the magic-sysrq
commands.  I will try to reboot the system, and see if I can keep a
console up and use the magic-sysrq commands next time the process gets
stuck.


Is this the same behavior people are seeing on the SMP A500's?  Any
ideas on where to continue debugging this (possible deadlock problem?
Can I see what locks are being held by the stuck process? etc..)  I will
continue to poke around and see what I can find also.

Thanks,

- Ryan
