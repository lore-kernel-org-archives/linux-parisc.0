Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E6B64845
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 08:44:16 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id h8SEiFRK006999
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 15:44:15 +0100
Date: Sun, 28 Sep 2003 15:44:14 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0309281530440.29331@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.6.0-test6-pa0 undefined references
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

Hi,

I can't compine 2.6.0-test6-pa0, compiling stops with the following
error message:


kernel/built-in.o(.text.try_to_wake_up+0xf8): In function
`try_to_wake_up':
: undefined reference to `sched_clock'
kernel/built-in.o(.text.schedule+0x7c): In function `schedule':
: undefined reference to `sched_clock'
kernel/built-in.o(.text.copy_process+0x4e0): In function `copy_process':
: undefined reference to `sched_clock'
make: *** [.tmp_vmlinux1] Error 1



The same config compiled fine with 2.6.0-test4-pa8.

Last tested with CVS checkout of 5 minutes ago.


PS: I also can't compile smbfs in the kernel, but as module:
 (error about undefined reference to `low2highuid`)


Thanks, Max


PS: .config will be send on request
