Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02617
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 16:49:13 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Dec 2000 23:51:57 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA29916;
	Tue, 12 Dec 2000 10:51:38 +1100
Date: Tue, 12 Dec 2000 10:51:38 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: law@redhat.com, rth@redhat.com, Richard Hirst <rhirst@linuxcare.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <200012111848.NAA20477@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012121041590.27939-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 11 Dec 2000, John David Anglin wrote:

> Progress has been slow in debugging this because there are problems with
> the current version of gdb.

You're not kidding!  I'm rewriting the gdb hppa target dependent code to
use the gdb multi-arch scheme...

>  Register printouts and even the location
> of seg faults is sometimes wrong.  Have to use adb to check results (yuck).
> Need to get the current cvs version of gdb working properly on the pa again.

-- 
Linuxcare.  Support for the Revolution.
