Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24677
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 10:11:23 -0700
Message-Id: <200011271713.MAA28610@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RPM and hppa
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Mon, 27 Nov 2000 12:13:02 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E140RZ5-0003I4-00@the-village.bc.nu> from "Alan Cox" at Nov 27, 2000 04:55:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > I think the above is a different problem.  The explosion is most likely
> > a problem with exception edges in the gcse pass.  Try `-fno-gcse'.  This
> > also appears in the tFile.cc libio test.
> 
> I've not yet had a chance to try this. I see the same behaviour building Qt
> so I may try it on that

Another option that might help if exceptions aren't needed is `-fno-exceptions'.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
