Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id D45874829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 07:10:07 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18KJB4-0001Ya-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 06 Dec 2002 15:10:02 +0100
Date: Fri, 6 Dec 2002 15:10:01 +0100
Message-ID: <3DED9B890000084D@ocpmta6.freegates.net>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] superio.c -BUG
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi all,
>
>Working on lkcd port of Bruno Vidal on a b2k (gcc-3.0.4), I encounter th=
e
>following bug:
>Dump compression value is 0x0 ...
>Dump device index 0 ...
>Initialise iodc dump device:dump_iodc_init(): reset done
>dump_iodc_open(): get module info : 16
>dump_iodc_open(): get ENTRY INIT.
>kernel BUG at superio.c:109!
>WARNING! Stack pointer and cr30 do not correspond!
>Dumping virtual address stack instead
>
>What is troubling me in the code is the contradiction between code and
comments:
>        if ((results & 0x80) =3D=3D 0) {
>#ifndef CONFIG_SMP
>                /* HACK: need to investigate why this happens if SMP ena=
bled
>*/
>                BUG(); /* This shouldn't happen */
>#endif
>                return;
>        }
>
>[I am running here a kernel 2.4.19-pa24 + dump_patch of bruno but it is
>still  the same in 2.4.20]
>
>Can somebody could confirm me what is right: code or comment?
>
Stupid question isn't it? (Sorry I need rest)

Never the less, I would go further and notice that:
 results =3D inb(IC_PCI1+0);

I well find the declaration of inb as extern unsigned char inb(int addr);=

(in io.h) but can somebody explain me where this function is defined (I
scan all .c .h .s and do not find)?

Just to see if a wait does not have to be inserted after previous outb?

Thanks for attention,
    Joel



*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
