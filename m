Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA18310
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 08:31:09 -0600
Message-Id: <199909221431.HAA27632@milano.cup.hp.com>
To: Philipp Rumpf <prumpf@suse.de>
cc: Hannu Martikka <martikka@stybba.ntc.nokia.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems 
In-reply-to: Your message of "Wed, 22 Sep 1999 15:35:09 PDT."
             <19990922153509.B5481@suse.de>
Date: Wed, 22 Sep 1999 07:31:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> Hannu Martikka wrote:
> > With 715/80 I get following:
> > Boot
> > :disk(....)/stand/vmlinux
> 
> you might want to try to boot via tftp / bootp as this is what most of us do
> and it seems to work for us.

Goodi,
Are you using HP-UX boot loader?

To boot from disk, one should do "make Image" and dd the Image to disk.
This will trash the HP-UX file system so only do this on a spare disk!
The loader used is then from the parisc-linux source tree.

grant
