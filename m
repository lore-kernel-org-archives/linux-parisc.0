Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01095
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Nov 2000 16:22:28 -0700
Message-Id: <200011112329.PAA09355@milano.cup.hp.com>
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000 e25 
In-reply-to: Your message of "Sat, 11 Nov 2000 23:12:55 PST."
             <20001111231253.I9666@neep.com.au>
Date: Sat, 11 Nov 2000 15:29:14 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Andrew Shugg wrote:
> > Considering how often this question comes up is there anyone out there
> > that is interested in tracking down the info to port linux to this class
> > of box.
> > 
> > Server boxes may be classed as boring to some but there seem to be a
> > large number of people who have at least one of them sitting about doing
> > nothing.
> > 
> > Joe.
> 
> I don't perceive the problem to be a lack of willingness, or interest, but
> has already been stated the older systems contain a lot of proprietry stuff
> that isn't sufficiently documented for people to work on.

AFIAK, the chipsets for I/O devices in E25 have plenty of documentation.
The issue is someone has to clean them up and get a lawyer to approve
their publication. It's all about IP and avoiding lawsuits. This has
been discussed before.  Any HP employees interested in doing this "on
their own time" can contact me and I'll help locate unpublished docs.

Note that PDC is the same for Nova-Class (EFGHI-class) boxes as for
the workstations for the most part. So someone could start by just
trying to boot those boxes and see how far it gets before dying.


> Maybe as the parisc port grows more popular and attracts more resources,
> some enthusiastic people will get it happening.  =)

Having worked on the HPUX SCSI driver (scsi3 and scsi1) for E25 and
similar boxes, I question anyone's sanity who volunteers to write
drivers for SPIFI chips - even with full documentation. I would rather
give folks that interested in contributing a 715/33! (or my gosh /50's!)

Yes - I know folks who collect PDP's and keep them running in their
garage...'nuf said.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
