Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA20874
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 16:25:33 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 23:27:56 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA07834;
	Wed, 29 Nov 2000 10:27:20 +1100
Date: Wed, 29 Nov 2000 10:27:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Include trouble
In-Reply-To: <200011281737.MAA24142@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0011291008100.18407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 28 Nov 2000, John David Anglin wrote:

> Hmm.  Most 32 bit systems use "unsigned int" rather than "unsigned long".

There's some precedent for using "unsigned long", as that is what is used
on 32-bit hpux11 and osf gcc targets.

current sourceware CVS gcc/config/pa/:

$ grep SIZE_TYPE *
grep: CVS: Is a directory
pa-64.h:#undef SIZE_TYPE
pa-64.h:#define SIZE_TYPE "long unsigned int"
pa-hpux.h:#undef SIZE_TYPE
pa-hpux.h:#define SIZE_TYPE "unsigned int"
pa-hpux11.h:#undef SIZE_TYPE
pa-hpux11.h:#define SIZE_TYPE "long unsigned int"
pa-hpux7.h:#undef SIZE_TYPE
pa-hpux7.h:#define SIZE_TYPE "unsigned int"
pa-linux.h:#undef SIZE_TYPE
pa-linux.h:#define SIZE_TYPE "unsigned int"
pa-osf.h:#undef SIZE_TYPE
pa-osf.h:#define SIZE_TYPE "long unsigned int"
pa-pro-end.h:#undef SIZE_TYPE
pa-pro-end.h:#define SIZE_TYPE "unsigned int"
pa.h:#define SIZE_TYPE "unsigned int"

Some further grepping shows quite a number of other 32-bit gcc targets
using "unsigned long", but I didn't see any 32-bit linux targets in the
list.  Paul, If you change back to "unsigned int", please change
gcc/config/pa/pa-linux.h too.

Alan
-- 
Linuxcare.  Support for the Revolution.
