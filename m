Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22DB74829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 00:06:55 -0700 (MST)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by atlrel8.hp.com (Postfix) with ESMTP id C500D1C01332
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 02:06:44 -0500 (EST)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_25184)/8.9.3 SMKit7.02) with ESMTP id MAA19735
	for <parisc-linux@lists.parisc-linux.org>; Tue, 1 Apr 2003 12:39:16 +0530 (IST)
Message-ID: <3E89DBF4.102AC68A@india.hp.com>
Date: Tue, 01 Apr 2003 12:35:32 -0600
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PDC console problem.
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

I am trying to boot PA-Linux off a PA-RISC simulator. I am facing a
problem with the PDC console. On my first attempt, I saw the message
asking me to switch the console. So I  turned the PDC console config
option on ( the serial mux option was turned off). I added the parameter
'console=ttyB0' in 'palo.conf'. I created the device file '/dev/ttyB0'
with major/minor = 11/0 on my ramdisk. With this, the kernel boots up on
the simulator all the way upto the sash ( Stand-alone shell) prompt. I
can even see the prompt. But, the problem is that this console doesnt
seem to be accepting input from the keyboard. It is kind of like in a
locked state.

I was going through some of the FAQ and the mailing list archive and
understand that the PDC console is not a full blown console and can only
display output. Is is true that the PDC console cannot accept keyboard
input? Or am I missing something?

I also see that there are 2 versions of the PDC console driver :
'arch/parisc/kernel/pdc_cons.c' and 'drivers/char/pdc_console.c'. Both
use the device ttyB. From what I understand, the former is used before
any of the serial drivers are initialized during boot, and has only
write capability. The latter is the full-blown console driver (though I
am not sure if it has write capability). Is my understanding correct?

I am using the source tarball 'palo-latest.tar.gz' from the parisc-linux
cvs respository and cross-compiling this on an x86 box.

Regards,
Naresh.

PS: My "init" process is 'sash' and I also have a '/dev/console' device
( major=5 minor=1) on my ramdisk. The Serial driver config option is on
and I can see it being initialized in the boot path after the PDC
console.
