Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id A194B4854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Jan 2004 11:03:08 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1AjMh1-0005cn-00
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Jan 2004 19:03:07 +0100
Date: Wed, 21 Jan 2004 19:03:05 +0100
Message-ID: <400CB89F00001978@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "PARISC list" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

On the my b2k when I add 'CONFIG_PDC_CONSOLE' the system hang just after
"Searching for devices..." leting the led CDROM continuously bright ???

With some printk, I reach to figure out that is at the pdc_suspend_usb()
point where the boot hang. I try to bypass this and so it boot well.

In fact the big difference with a kernel without CONFIG_PDC_CONSOLE is the
early call to pdc_console_init_force() which (before register the pdc_cons
do:
[snip]
        /* If the console is duplex then copy the COUT parameters to CIN.*/
        if (PAGE0->mem_cons.cl_class == CL_DUPLEX)
                memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons, sizeof(PAGE0->mem_cons));

        /* register the pdc console */
        register_console(&pdc_cons);
}

I also try to bypass this memcpy (and restore pdc_suspend_usb() call) and
it boot also well.

In sumary, on the b2k, this early memcpy() seems to break something in the
later pdc_suspend_usb() call. My problem is the pdc_suspend_usb()
which results finaly in a call to real32_call_asm(): actualy asm code in
which
it's difficult to insert printk to analyse the difference of behaviour ?)

I also already get a toc but didn't give me any relevant info on what happen
:(

Any idea to help me to get more details about this pb?

Thanks in advance,
    Joel

PS:
I added some printk to get some pdc addresses:
static void pdc_console_init_force(void)
{
        if (pdc_console_initialized)
                return;
        ++pdc_console_initialized;

        if (PAGE0->mem_cons.cl_class == CL_DUPLEX) {
                printk(KERN_INFO "pdc_console_init_force() would set a CL_DUP.\n");
                printk(KERN_INFO "PAGE0->mem_cons address: %p.\n", &PAGE0->mem_cons);
                printk(KERN_INFO "PAGE0->mem_kbd address: %p.\n", &PAGE0->mem_kbd);
                printk(KERN_INFO "PAGE0->mem_kbd size: %d.\n", sizeof(PAGE0->mem_cons));
        };
        /* If the console is duplex then copy the COUT parameters to CON.*/
/*
        if (PAGE0->mem_cons.cl_class == CL_DUPLEX)
                memcpy(&PAGE0->mem_kbd, &PAGE0->mem_cons, sizeof(PAGE0->mem_cons));
 */

        /* register the pdc console */
        register_console(&pdc_cons);
}

The 32-bit Kernel has started...
pdc_console_init_force() would set a CL_DUP.
PAGE0->mem_cons address: 100003a0.
PAGE0->mem_kbd address: 10000400.
PAGE0->mem_kbd size: 48.

But that couldn't help more for the moment :(



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
