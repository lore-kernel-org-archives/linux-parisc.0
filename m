Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA30719
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 13:09:32 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 5 Sep 2000 19:09:45 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13WO6Q-0001ML-00
	for <parisc-linux@thepuffingroup.com>; Tue, 05 Sep 2000 15:09:50 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 05 Sep 2000 15:09:50 -0400
Message-ID: <87lmx6k64h.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Three kinds of userspace/VM/whatever bugs
List-ID: <linux-parisc.vger.kernel.org>

1) When forking a lot of processes, eventually the I-cache gets
   corrupted and you get "illegal instruction" or "halted by break 0,0
   (yes, this sucks)" errors.  This one's easy to demonstrate:

#!/bin/sh

while true; do
        cat <<EOF >whatever.foo
foo foo foo foo foo foo foo
EOF
done

   This will quickly die or crash the machine.  This is due to our
   broken cache flushing functions.  If you kludge around this (just
   flush the entire cache all the time) on 2.3.99pre8 then you will no
   longer lose, but of course the machine will run slowly (i.e. don't
   do this on a PA8500 :-) 2.4.0-test6 has other problems which is why
   I don't use it for userspace work (see below).

2) When forking, random things happen in the child process before
   exec() sometimes causing the shell to segfault (this usually
   manifests itself as a fault in the environment variable setup code
   in ash).  This can be replicated by running most large configure
   scripts.

   This is due to our broken TLB flushing macros.  First of all the
   'if (mm == current->mm)' check in these macros does appear to be
   bogus, as removing it "fixes" some of these problems.  Second, we
   have the same problem as above in that the
   flush_(instruction|data)_tlb_range inlines incorrectly use
   p[id]tlbe and we don't distinguish between user and kernel spaces.
   Also __flush_tlb_space basically doesn't work, for the same reason.

   Again, kludging around this by always flushing the entire TLB and
   removing the conditional above makes my A180 stable but slightly
   slower, on 2.3.99pre8.

3) 2.4.0-test6 has some kind of bug that manifests itself in the
   following type of oopsen:

bad magic 807025a (should be c016f720), wq bug, forcing oops.

   These come from this macro in <linux/wait.h>:

#define CHECK_MAGIC(x) if (x != (long)&(x)) \
	{ printk("bad magic %lx (should be %lx), ", (long)x, (long)&(x)); WQ_BUG(); }

   Unfortunately, because they just hang the machine without printing
   a register dump I am unable to see where exactly they are being
   triggered from.  May I suggest that the person who wrote this macro:

#define WQ_BUG() do { \
	printk("wq bug, forcing oops.\n"); \
	for(;;); \
} while (0)

   be shot.  Argh.  I'll track this some more after doing so.

These bugs are all holding up the progress of userspace work.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
