Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF571482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Nov 2001 23:15:50 -0700 (MST)
Message-Id: <200112010611.XAA11815@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Fri, 30 Nov 2001 09:46:04 +0100." <200111300843.BAA03660@puffin.external.hp.com>
Date: Fri, 30 Nov 2001 23:11:07 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: two minor c3k bugs
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

Helge Deller wrote:
> Forwarded to the list, since it may be of interest for others too:
> 

sure.

> On Friday 30 November 2001 08:43, Grant Grundler wrote:
...
> Hmm, I still have 2.4.16-pa4 here and it definately shows 
> "2.4.16-pa4" for me. Maybe a SMP problem ?

No. I only build UP kernels for the C3k.

> You could try to double the size of the udelay() parameter
> in lcd_print to see if it cures your problem.

After a reboot it worked fine. Could be a timing problem.
Since I can't reproduce it reliably and it's minor, I'm not
going to chase this. Someday when I get bored and ate too much
chocolate (dark, organic, Belgian from Trader Joe's), I might
try to run IRC on the LCD... ;^)

...
> Currently I use "kill_proc(1, SIGINT, 0);" to kill the init-process -
> which is normally a reboot-command and gives the above messages.

Ok. that makes sense.

> That's AFAICS not the right solution, but nfortunately I don't know
> how to do it correct right now.

./kernel/sys.c:         printk(KERN_EMERG "Power down.\n");

That chunk of code seems to do the right thing:
        case LINUX_REBOOT_CMD_POWER_OFF:
                notifier_call_chain(&reboot_notifier_list, SYS_POWER_OFF, NULL);
                printk(KERN_EMERG "Power down.\n");
                machine_power_off();
                do_exit(0);
                break; 

I know that msg since I regularly "powerdown" my c3k.
Perhaps replicate that code?

cheers,
grant
