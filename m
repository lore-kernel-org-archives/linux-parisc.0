Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA13926
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 17:57:25 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 23:58:10 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA11701;
	Wed, 27 Sep 2000 10:57:32 +1100
Date: Wed, 27 Sep 2000 10:57:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@puffin.external.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: binutils dhd
In-Reply-To: <200009262152.PAA12726@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.21.0009271045001.10201-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 26 Sep 2000, David Huggins-Daines wrote:

> Sometimes we get the "split field selectors" problem in import stubs
> if the distance between the GP and the PLT is not a multiple of 8
> bytes.  Use alignment constraints on .plt, .got, and .data to fix
> this.

Ouch.  But aligning doesn't fix the problem (well, it may in a particular
case).  The reason aligning won't always work is that import and long
branch stubs are interspersed in the stub section, and PIC long branch
stubs happen to be 12 bytes long.  Which messes with your carefully
constructed 8 byte alignment.

The proper fix is to use lr_sel and rr_sel when building the import stubs,
so I'm reverting your change unless you have some other reason for wanting
8 byte alignment.

Alan
-- 
Linuxcare.  Support for the Revolution.
