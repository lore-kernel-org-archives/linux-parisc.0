Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (unknown [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 476B64829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 10:44:13 -0600 (MDT)
Date: Wed, 16 Apr 2003 18:44:11 +0200
Message-ID: <3E9BA3A600000DC1@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
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

>cool - let me add some general comments.
>You might break the diff up into chunks along the lines that
>I've commented on them below. You should end up with something like
>15-20 patches.

Well I already create:
a chunck containing debian-configs (I call it 00_parisc_debian-configs.patch)
[about 140k] (would it be submited?)

another chunk containing all parisc specific (named 01_parisc.patch) containing
arch/parisc, include/asm-parisc and another noticed "parisc specific" [about
160k]

>
>>  Documentation/Configure.help                      |   90
>	I expect parisc-specific changes here.

Still have to care about a very small hunk (already from 2.4.19-pa2)
@@ -17555,6 +17595,10 @@
   doing that; to actually get it to happen you need to pass the
   option "console=lp0" to the kernel at boot time.

+  Note that kernel messages can get lost if the printer is out of
+  paper (or off, or unplugged, or too busy..), but this behaviour
+  can be changed. See drivers/char/lp.c (do this at your own risk).
+
   If the printer is out of paper (or off, or unplugged, or too
   busy..) the kernel will stall until the printer is ready again.
   By defining CONSOLE_LP_STRICT to 0 (at your own risk) you

The rest is "parisc specific"

>
>>  arch/parisc/config.in                             |    6
>...
>	parisc specific (our tree is authoritative)
>	Need to review for changes in Marcelo's tree.
>	I expect Marcello to take the mess as-is if there
>	are no conflicts.
>
Just more some small changes of mine (matching as near as possible changes
of other platform) to obtain a bootable 32bits kernel for my b2k (and its
fameous ide cdrom) and a b180L :)

Thanks in advance for your additional attention,
    Joel

PS: As advise I will not consider generic patches (the main require knowledge
I do not have)

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
