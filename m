Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA14090
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 10:34:43 -0700
Message-Id: <199911171734.MAA16975@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Today's boot experience on a 735
To: law@cygnus.com
Date: Wed, 17 Nov 1999 12:34:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <1129.942809756@upchuck> from "Jeffrey A Law" at Nov 16, 99 08:35:56 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   > you know why the DLT section
>   > disappeared when I used the sort key of 255 for AFTERDLT?  Although
>   > I haven't tried it, it may not be possible to create an object file with
>   > both DLT and AFTERDLT sections.
> Not really.  I do know that we had major problems with pxdb (post-link 
> processor
> on HPs) mysteriously removing subspaces with sort keys of 255 in the past.

I did a little testing with your second suggestion.  What happens
is DLT is empty except for the one symbol that I created in it.  The linker
always goes last and it seems to dump the common symbols into the last
section with sort key 255.  I think DLT was deleted because it was
empty.

Is there a solution that doesn't rely on this obscure linker behaviour?
I think that if gas were modified to allocate common symbols in a special
section, then we wouldn't have this problem.  However, I think this would
require that common symbols would always have to be fixed in size. While
this is normal practice in C, the assembler would not work with fortran
where it is normal practice to have common blocks of varying size.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
