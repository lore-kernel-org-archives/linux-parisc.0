Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 586154829
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 10:51:08 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18kpQ3-0002XC-00
	for <parisc-linux@parisc-linux.org>; Mon, 17 Feb 2003 18:51:07 +0100
Date: Mon, 17 Feb 2003 18:51:01 +0100
Message-ID: <3E4ABE5000002044@ocpmta2.freegates.net>
In-Reply-To: <3E48B5950000297E@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] .config fo a N class?
To: parisc-linux@parisc-linux.org
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

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>To: parisc-linux@parisc-linux.org
>Subject: [parisc-linux] .config fo a N class?
>Date: Mon, 17 Feb 2003 12:42:54 +0100
>
>
>Hi all,
>
>I have the oportunity to test temporary a N class (N4000-55) dual processor.
>
>I grab the config file of the test-drive L model; apply it against current
>k-2.4.20-pa26 (just change 64 to 32 bits).
                            ^^^^^^^^^^^^^ My bad: I would have to remember
that hpux-11 have to be 64bits on L and N servers :?

> I install this kernel on a ext
>scsi disk and try to boot; unforunately it doesn't goes further than palo
>message:
>...
>a common symptom -- search the FAQ and ml ..."
>
>I try get a pim (from gsp TC); unfortunately empty (I mean all null values).
>
>The only report (on esiee) I found regarding this kind of server was running
>a 2.4.9 64 bits kernel.
>
>Can somebody help me to find the corresponding config file?
>

Well, for now I just boot with a dpkg kernel-image-2.4.19-64 (up) and still
have to see what is wrong with eth0:
eth0 Digital DS21143 Tulip rev 65 at 0x80 ... irq 128

Is there known problem with this type of NIC?

Next step would be to install a gcc-64 to recompile the kernel 2.4.20-pa27
and have a new look on this eth0.

Joel



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
