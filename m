Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA30644
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Dec 1999 04:31:24 -0700
Message-ID: <19991217113345.21665.qmail@web501.mail.yahoo.com>
Date: Fri, 17 Dec 1999 03:33:45 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] help on ramdisk.c
To: Thierry SIMONNET <t.simonnet@esiee.fr>, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Make sure that you get
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/ramdisk.bin-1991108
and copy this file as ramdisk.bin to your source
directory (e.g. /usr/src/linux/). Then "make vmlinux"
should work.

Ulrich

--- Thierry SIMONNET <t.simonnet@esiee.fr> wrote:
> I work on a HP712/60 workstation under HPUX 10.20.
> I compile with cc, gcc or aCC.
> 
> I can't compile ramdisk.c in any way and then i
> can't do "make vmlinux" .
> 
> Could you help me?
> 
> 
>
=========================================================
> Thierry SIMONNET
> Responsable du Service des Moyens Informatiques
> Généraux
> Groupe ESIEE - CCIP
> Cité Descartes - BP 99 - 2 Bd Blaise Pascal
> 93162 NOISY le Grand cedex
> 
> tel: 01 45 92 66 24  fax: 01 45 92 67 99 e-mail: 
> t.simonnet@esiee.fr
>
=========================================================
> 
> 
> 
> 
> 
>
---------------------------------------------------------------------------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 

__________________________________________________
Do You Yahoo!?
Thousands of Stores.  Millions of Products.  All in one place.
Yahoo! Shopping: http://shopping.yahoo.com
