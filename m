Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA30473
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Sep 2000 08:31:23 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 27 Sep 2000 14:32:11 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: binutils dhd
References: <Pine.LNX.4.21.0009271045001.10201-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 27 Sep 2000 10:31:59 -0400
Message-ID: <87hf71oqhs.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> The reason aligning won't always work is that import and long branch
> stubs are interspersed in the stub section, and PIC long branch
> stubs happen to be 12 bytes long.  Which messes with your carefully
> constructed 8 byte alignment.

No, the issue is the alignment of the distance between the GP and the
PLT, it has nothing to do with the placement of the stubs AFAIK.

> The proper fix is to use lr_sel and rr_sel when building the import stubs,
> so I'm reverting your change unless you have some other reason for wanting
> 8 byte alignment.

Okay, so long as this fixes it, I have no objections.  My changes were
pretty ugly anyway.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
