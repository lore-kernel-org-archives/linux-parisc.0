Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id B390D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 09:01:07 -0600 (MDT)
Date: Wed, 29 May 2002 11:01:18 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529110118.A3691@systemhalted>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020529141231.GG9919@tykepenguin.com>; from patrick@tykepenguin.com on Wed, May 29, 2002 at 03:12:31PM +0100
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

> 
> That's only set like that as a last-dich attempt to get it to work :-(
> 
> I'm going to have to give up on this, I can't spend all week trying to get it to
> work. What I don't understand is that I move a working .config to the new kernel
> source and both the serial console AND the scsi stop working.
> 
> Ah well, it was a nice idea while it lasted. It's just a bit hard debugging code
> when the only error you get is "Stack pointer and cr30 do not cor
> respond" repeated endlessly....
> 
> patrick
>

You can't always copy a .config from kernel to kernel. The kernel source
dictates what will be _in_ the .config. I usually run 'make mrproper'
and then have 'make oldconfig' or 'make ???config' recreate the config files
to suit the material in the kernel.

When switching to a new source tree I recommend:
make mrproper
make oldconfig
make menuconfig (to suit your tastes)
...


As for the endless 'Stack pointer and cr30 do not correspond!'....

I believe that is a bug in traps.c and I have code to give a proper dump.
I haven't been able to get anyone who knows to explain how the dump_stack in 
traps should _really_ work :)

AFAI understand the following works (I've tested it on my kernels with what 
looks to be a successfull dump while doing some bad things (props to Bame
for helping me out) ;)

BTW, what led me to this solution is that the printk in the else is
completely bogus... so I rewrote the else.

Q: When do you get 'Stack pointer and cr30 do not correspond'?

==========
--- ./linux/arch/parisc/kernel/traps.c     Tue May 21 00:01:37 2002
+++ ./linux/arch/parisc/kernel/traps.c     Tue May 21 00:30:42 2002
@@ -189,10 +189,25 @@
                }
                else
                {
-                   /* Stack Dump! */
-                   printk(KERN_CRIT "WARNING! Stack pointer and cr30 do not correspond!\n");
-                   printk(KERN_CRIT "Dumping virtual address stack instead\n");
-                   dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
+
+                   stack_start = sp & ~(INIT_TASK_SIZE - 1);
+                   if (stack_start == cr30) {
+
+                       /* We're in a non-interrupt stack and cr30 matches
+                          the start of the stack */
+
+                       dump_stack(stack_start, sp, 0);
+
+                   }
+                   else
+                   {
+
+                       /* Stack Dump! */
+                       printk(KERN_CRIT "WARNING! Stack pointer and cr30 do not correspond!\n");
+                       printk(KERN_CRIT "Dumping virtual address stack instead\n");
+                       dump_stack((unsigned long)__va(stack_start), (unsigned long)__va(sp), 0);
+
+                   }
                }
        }
 #endif
========== 
