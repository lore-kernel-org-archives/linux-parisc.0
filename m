Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E7784829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 11:00:13 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18K0IC-0003Dm-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 05 Dec 2002 19:00:08 +0100
Date: Thu, 5 Dec 2002 18:59:36 +0100
Message-ID: <3DED9BBD0000056F@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] superio.c -BUG
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

Working on lkcd port of Bruno Vidal on a b2k (gcc-3.0.4), I encounter the=

following bug:
Dump compression value is 0x0 ...
Dump device index 0 ...
Initialise iodc dump device:dump_iodc_init(): reset done
dump_iodc_open(): get module info : 16
dump_iodc_open(): get ENTRY INIT.
kernel BUG at superio.c:109!
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

What is troubling me in the code is the contradiction between code and co=
mments:
        if ((results & 0x80) =3D=3D 0) {
#ifndef CONFIG_SMP
                /* HACK: need to investigate why this happens if SMP enab=
led
*/
                BUG(); /* This shouldn't happen */
#endif
                return;
        }

[I am running here a kernel 2.4.19-pa24 + dump_patch of bruno but it is
still  the same in 2.4.20]

Can somebody could confirm me what is right: code or comment?

Thanks in advance,
    Joel

*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
