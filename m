Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA26722
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 11:17:56 -0700
Message-Id: <200011271819.NAA06436@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RPM and hppa
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Mon, 27 Nov 2000 13:19:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E140RZ5-0003I4-00@the-village.bc.nu> from "Alan Cox" at Nov 27, 2000 04:55:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I think the above is a different problem.  The explosion is most likely
> > a problem with exception edges in the gcse pass.  Try `-fno-gcse'.  This
> > also appears in the tFile.cc libio test.
> 
> I've not yet had a chance to try this. I see the same behaviour building Qt
> so I may try it on that

If the problem is in fact the exception handling method, I think we should
look at implementing the DWARF2 unwind mechanism and exception handling using
this unwind mechanism.  The default method of handling exceptions is sjlj.
See the description of DWARF2_UNWIND_INFO and INCOMING_RETURN_ADDR_RTX in
gcc/tm.texi for more info.  Alan Modra may want this for gdb as well.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
