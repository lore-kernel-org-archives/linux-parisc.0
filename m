Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA23070
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 16:43:35 -0600
Message-Id: <200008111643.MAA07355@hiauly1.hia.nrc.ca>
Subject: Re: Millicode calls, GP register, ld -r
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 11 Aug 2000 12:43:30 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@cygnus.com, alan@linuxcare.com.au, dhd@linuxcare.com,
        parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
In-Reply-To: <20000811105647.N10843@vodka.thepuffingroup.com> from "Matthew Wilcox" at Aug 11, 2000 10:56:47 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Fri, Aug 11, 2000 at 06:30:36AM -0600, Jeffrey A Law wrote:
> > The other way it's used is to handle intra-space calls/returns.  I don't know
> > if that's an issue for y'all or not.
> 
> we just use one space for each process, so we never call into a different
> space, except to do syscalls.

You might want to look at the code following line 6319 in pa.md (gcc 2.96)
to see that it does what you want for EH handling under linux.  This is for
builtin_longjmp.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
