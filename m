Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA19182
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 09:30:31 -0600
Date: Wed, 22 Sep 1999 18:15:56 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: Philipp Rumpf <prumpf@suse.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems 
In-Reply-To: <199909221431.HAA27632@milano.cup.hp.com>
Message-ID: <Pine.HPX.4.05.9909221807370.1697-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 22 Sep 1999, Grant Grundler wrote:

> Philipp Rumpf wrote:
> > Hannu Martikka wrote:
> > > With 715/80 I get following:
> > > Boot
> > > :disk(....)/stand/vmlinux
> > 
> > you might want to try to boot via tftp / bootp as this is what most of us do
> > and it seems to work for us.
> 
> Goodi,
> Are you using HP-UX boot loader?
I was... It used to work (at the time when kernel didn't... :)

> To boot from disk, one should do "make Image" and dd the Image to disk.
> This will trash the HP-UX file system so only do this on a spare disk!
> The loader used is then from the parisc-linux source tree.
I setup the tftp/bootp server and now I can boot my 715/80 from lan.
Last thing it says is "urgh" and then it stays in for(;;). I cannot say
wether that is good or bad :)

> grant
- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
