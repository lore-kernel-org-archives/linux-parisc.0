Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA16977
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 10:30:57 -0600
Message-Id: <200010181636.JAA14184@milano.cup.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /proc/interrupts 
In-reply-to: Your message of "Wed, 18 Oct 2000 03:41:22 PDT."
             <00101803412200.00279@P100>
Date: Wed, 18 Oct 2000 09:36:31 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge!

Helge Deller wrote:
...
> 1. The until now used virtual IRQ's gets new numbers and increments in every 
> region by 32 for parisc32 and 64 for parisc64. The old IRQ regions 
> incremented by 256.

prumpf did something like this too.
It's better - but IMHO not "optimal".

I've been thinking about an "optimal" solution but haven't had a chance
to try it out. Here's my proposal:
o "invent" (yeah...I heard you, Carly! :^) a global "action" table.
o All IRQ allocation will get an "action" entry from the global table.
o And each IRQ region is a table of "action" pointers.
o "busy" IRQ region entries point to entries in the global "action" table.

"action" is a IRQ handler + arguments stuffed in a data structure.

Here are some examples of why I think this is "optimal":
o Older Workstations typically only need 10-20 "action" entries in
  2-4 IRQ regions.
o A500/C3000/J5000/L2000 might need about the same number of "action"
  entries but spread over 8 IRQ regions (4 CPU + 4 I/O Sapic).
o N-4000 might use over 60 entries in 22 IRQ regions!
  (12*4+8+5) That's 12 PCI Slots, 8 CPUs, and 5 built-in PCI devices
  spread over 8 CPU + 14 I/O Sapic.
o I don't know the limits of Superdome which was just announced.
  I've been asked about running linux on Superdome and my reply is
  first get it running on N-class (which isn't currently "in-plan"
  officially).

(Note: Even though today we only allocate one IRQ region for all CPUs,
in the future I'd like to see each CPU get it's own region.)

> 2. since we now shift by values of 5 (parisc32) or 6 (parisc64) bits, the 
> time needed to calculate the offsets may have changed. This needs to be 
> inspected.

I don't think this will be an issue.
I doubt a shift op takes longer (as measured in cycles) to shift more/less.


> 3. the new algorithm needs less memory than before.

yup - hypothetically by 4x or 8x. That's a good thing.

> By default I left the current behaviour in CVS, but you may activate the new 
> algorithm by changing the "#if 0" to "#if 1" in asm-parsic/irq.h and tell me 
> what you think.

That's cool...I'll enable it here for testing.
Remember - no news is good news :^)

thanks!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
