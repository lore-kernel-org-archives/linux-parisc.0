Return-Path: <hessu@hes.iki.fi>
Received: from he.fi (he.fi [213.28.116.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57D5E4843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 07:14:12 -0700 (MST)
Date: Wed, 28 Jan 2004 16:13:50 +0200 (EET)
From: Heikki Hannikainen <hessu@hes.iki.fi>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0401281500300.14924@jazz.he.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] K380 partial success, the state of the port?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


  Hi,

  I'm working on a K380 system with 4*240 MHz PA8200 CPUs, 2G of memory. I
initially installed it with the palinux-2.4.21-pa6-20030718-netinst.iso
netinstall CD images. I was amazed how smoothly it went! I've run the
alpha and sparc ports in the past on a bit less powerful hardware. I have
a couple of questions:

- the box seems awfully slow when compared to a similar HP-UX 11 box.
With 2.4.21-32 uniprocessor kernel 'time /bin/true' takes about 0.07s,
'time time /bin/true' takes 0.12s. 'time strace /bin/true' takes a
whopping 0.822s, almost all of which is spent in the system:

real    0m0.822s
user    0m0.010s
sys     0m0.790s

- with an SMP kernel it's much slower. 'time /bin/true' says:

real    0m0.420s
user    0m0.010s
sys     0m0.400s

'time time /bin/true' takes 0.65s, 'time strace /bin/true' takes 2.8
allowing me to read the output while it's running. I compiled the SMP
kernel myself, 2.4.24-pa0 from the CVS on 27.1.2004. On CPU bound tasks
it's ok, but fork/exec/ptrace seems very slow.

  Is the parisc port supposed to be this slow at it's current state, or is
this a problem which is specific to my setup?

- Should I go to the 2.6 tree? I compiled it from the CVS (to get the
tulip driver working) but the SCSI failed:

Linux version 2.6.1-pa10 (root@soul) (gcc version 3.0.4) #2 SMP Tue Jan 27

zalon_probe: Zalon vers field is 0x1, IRQ 37
ncr53c720-0: rev 0xf irq 37
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3e
Using anticipatory io scheduler
scsi: Device offlined - not ready after error recovery: host 0 channel 0
id 0 l

  Is this a known problem?

  Thank you for your efforts!

  - Hessu
