Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BE3A482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 17:31:11 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161GcV-0000Ue-00
	for parisc-linux@lists.parisc-linux.org; Wed, 07 Nov 2001 02:31:07 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 161GbX-0003cD-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 07 Nov 2001 02:30:07 +0200
Date: Wed, 7 Nov 2001 02:30:07 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011107023007.A12882@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 720/50 update
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

Albert Strasheim <fullung@ilink.nis.za>
Cc: 
Bcc: 
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Reply-To: 
In-Reply-To: <20011107003802.A6253@dogbert.localdomain>

Hello,

I promise I'll be quiet shortly. :-)

Serial consoles now work. Just uncomment the relevant lines in
/etc/inittab:

# Example how to put a getty on a serial line (for a terminal)
#
T0:23:respawn:/sbin/getty -L ttyS0 9600 vt100
T1:23:respawn:/sbin/getty -L ttyS1 9600 vt100

:-)

Two questions: when setting the hardware clock to the system clock, my
720 seems to hang. Is this a known issue? There seems to be a variable
one can set somewhere in the Debian init scripts to prevent this. I'll
look into it.

Then, some more interesting messages from /var/log/syslog:

Nov  7 02:12:01 bob kernel: Linux version 2.4.9-pa70 (s13640887@bach.sun.ac.za)
(gcc version 3.0.2 20010829 (prerelease)) #15 Wed Nov 7 02:07:35 SAST 2001
Nov  7 02:12:01 bob kernel: FP[0] enabled: Rev 3 Model 0
Nov  7 02:12:01 bob kernel: The 32-bit Kernel has started...
Nov  7 02:12:01 bob kernel: Determining PDC firmware type: Snake.

<snip>

Nov  7 02:12:07 bob /usr/sbin/cron[251]: (CRON) INFO (pidfile fd = 3)
Nov  7 02:12:07 bob /usr/sbin/cron[252]: (CRON) STARTUP (fork ok)
Nov  7 02:12:07 bob /usr/sbin/cron[252]: (CRON) INFO (Running @reboot jobs)
Nov  7 02:12:08 bob init: open(/dev/console): Input/output error
Nov  7 02:12:08 bob last message repeated 3 times
Nov  7 02:15:35 bob init: Trying to re-exec init

I installed binutils and it reconfigured libc6 here for some reason.

Now sshd goes bonkers a little later:

Nov  7 02:22:43 bob kernel: do_page_fault() pid=469 command='sshd' type=15 address=0x00000000
Nov  7 02:22:43 bob kernel:
Nov  7 02:22:43 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  7 02:22:43 bob kernel: PSW: 00000000000001001111111100001111
Nov  7 02:22:43 bob kernel: r0-3^I 00000000 00000000 4035da5b faf01860
Nov  7 02:22:43 bob kernel: r4-7^I 40378688 4002a09c 40028a64 faf00160
Nov  7 02:22:43 bob kernel: r8-11^I faf00158 00000001 00000001 00000001
Nov  7 02:22:43 bob kernel: r12-15^I faf00f94 faf00f8c faf00f86 faf00f7e
Nov  7 02:22:43 bob kernel: r16-19^I faf00f78 faf00f70 faf00f78 40378688
Nov  7 02:22:43 bob kernel: r20-23^I 00000001 40378688 4035da38 400288f8
Nov  7 02:22:43 bob kernel: r24-27^I faf00160 faf00158 00000001 0005cd5c
Nov  7 02:22:43 bob kernel: r28-31^I 4001c302 0000005e faf018e0 4000dd67
Nov  7 02:22:43 bob kernel: sr0-3^I 0000002b 0000002b 00000000 0000002b
Nov  7 02:22:43 bob kernel: sr4-7^I 0000002b 0000002b 0000002b 0000002b
Nov  7 02:22:43 bob kernel:
Nov  7 02:22:43 bob kernel: IASQ: 0000002b 0000002b IAOQ: 4035deeb 4035deef
Nov  7 02:22:43 bob kernel:  IIR: 0c201094    ISR: 0000002b  IOR: 00000000
Nov  7 02:22:43 bob kernel:  CPU:        0   CR30: 133c4000 CR31: 10330000
Nov  7 02:22:43 bob kernel:  ORIG_R28: 40378838

and again:

Nov  7 02:22:51 bob kernel: do_page_fault() pid=471 command='sshd' type=15 address=0x00000000
Nov  7 02:22:51 bob kernel:
Nov  7 02:22:51 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  7 02:22:51 bob kernel: PSW: 00000000000001001111111100001111
Nov  7 02:22:51 bob kernel: r0-3^I 00000000 00000000 4035da5b faf01860
Nov  7 02:22:51 bob kernel: r4-7^I 40378688 4002a09c 40028a64 faf00160
Nov  7 02:22:51 bob kernel: r8-11^I faf00158 00000001 00000001 00000001
Nov  7 02:22:51 bob kernel: r12-15^I faf00f94 faf00f8c faf00f86 faf00f7e
Nov  7 02:22:51 bob kernel: r16-19^I faf00f78 faf00f70 faf00f78 40378688
Nov  7 02:22:51 bob kernel: r20-23^I 00000001 40378688 4035da38 400288f8
Nov  7 02:22:51 bob kernel: r24-27^I faf00160 faf00158 00000001 0005cd5c
Nov  7 02:22:51 bob kernel: r28-31^I 4001c302 0000005e faf018e0 4000dd67
Nov  7 02:22:51 bob kernel: sr0-3^I 00000034 00000034 00000000 00000034
Nov  7 02:22:51 bob kernel: sr4-7^I 00000034 00000034 00000034 00000034
Nov  7 02:22:51 bob kernel:
Nov  7 02:22:51 bob kernel: IASQ: 00000034 00000034 IAOQ: 4035deeb 4035deef
Nov  7 02:22:51 bob kernel:  IIR: 0c201094    ISR: 00000034  IOR: 00000000
Nov  7 02:22:51 bob kernel:  CPU:        0   CR30: 133c4000 CR31: 10330000
Nov  7 02:22:51 bob kernel:  ORIG_R28: 40378838

Anything I should look into?

Regards,

Albert
