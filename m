Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA01583
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 23:42:25 -0600
Message-Id: <200005260543.WAA08459@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] trouble files 
In-reply-to: Your message of "Tue, 23 May 2000 20:07:50 PDT."
             <20000523200750.F17536@thepuffingroup.com>
Date: Thu, 25 May 2000 22:43:29 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Mathew (and others),

I'm posting these comments so the same files don't get done twice.
And I think someone who has clue could do me a favor and submit
a patch to linus for a few minor things. So far, this merge looks
pretty easy.

...
drivers/char/Config.in
	Added CONFIG_GSC_LASI support for serial console support.

drivers/char/Makefile
	Added CONFIG_GSC_PS2 (gsc_ps2.o keyb_at.o) support
	Added CONFIG_HIL support

drivers/char/console.c
	Not sure we want the mod to vt_console_device().
	Seems we end up invoking MKDEV() twice.

	TODO:
	a) Need to add #ifdef __hppa__ (or something) around
	  "unregister_console(&pdc_cons)" invocation.
	b) Added CON_CONSDEV | CON_ENABLED to vt_console_driver[].
           Shouldn't this have #ifdef __hppa__ around it too?
	   This might not get accepted even with ifdefs...<sigh>.

drivers/char/serial.c
	Added CONFIG_GSC support.
	Should be straight forward to apply to pre8.
	Not sure "#ifndef __hppa__" code applies to PCI platforms as well.
	Certainly not to A400/L/N-class platforms.

...
> drivers/net/eepro100.c
	I had changed the default be "#define USE_IO".
	We wouldn't need this if MMIO BARs had kernel virtual addresses. 

> drivers/pci/pci.c
	"Bug" in linus' tree. spinlock_t declaration is getting picked
	up from spinlock.h by "accident" (included by another header file).
	Could someone submit this as a patch to linus?

> drivers/pci/pci.ids
	Please include this with pci.c in the patch.
	mkp added this for suckyio stuff.

...
> include/linux/pci.h
	Prumpf fixed a stub function in linus' tree.
	Another candidate to join pci.c patch submittal.

> include/linux/pci_ids.h
	goes with pci.ids above.

enjoy,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
