Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA28306
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 16:44:39 -0700
Message-Id: <200101152350.PAA10493@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100 
In-reply-to: Your message of "Mon, 15 Jan 2001 13:22:14 PST."
             <Pine.LNX.4.21.0101151256070.23322-100000@maestro.symsys.com>
Date: Mon, 15 Jan 2001 15:50:06 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> Okay, I grabbed the cross-compiler and various sources and managed to
> build a booting image.  Woohoo!

Good work!

> I also tried the lifimage you just posted
> to the FTP site.  Both kernels died at GSC detection because it didn't
> know the address f5fbf000.  I made this little change to ccio-dma.c:
> 
> --- arch/parisc/kernel/ccio-dma.c.orig  Mon Jan 15 12:40:05 2001
> +++ arch/parisc/kernel/ccio-dma.c       Mon Jan 15 13:05:01 2001
> @@ -1174,6 +1174,7 @@
>  ** that can't be detected by PA/EISA/PCI bus walks.
>  */
>         switch((long) d->hpa) {
> +       case 0xf5fbf000L:       /* C1O0 (wild guess!) */
>         case 0xf7fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>         case 0xf3fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>                 /* ccio_hpa same as C200 IOA0 */                             

As Ryan noted, this is a hack. We need a real PA bus walk - not
just depending on the devices PDC tells us about.
     

> Data access rights fault in kernel: Code=26 regs=c7f9c840 (Addr=0000000c)

Looks like a null ptr dereference.

>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001100000000000001011
> r0-3     00000000 c02b2580 c018e784 c02c2c88
...
> IASQ: 00000000 00000000 IAOQ: c010c8fc c010c900

IOAQ is the current PC
GR02 is the return ptr - ie caller address + 8

See build-tools/a.c
If you look up the symbols of those, very likely you'll
find the code that doesn't like your C100.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
