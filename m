Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22687
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 15:02:42 -0600
Received: from videotron.ca ([216.113.0.11]) by
          VL-MS-MR002.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with ESMTP id G2N96201.5DV for
          <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 17:03:38 -0400
Sender: fleet@mailserv2.iuinc.com
Message-ID: <39EE1028.35BC8D0A@videotron.ca>
Date: Wed, 18 Oct 2000 17:03:36 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: [Fwd: Re: [parisc-linux] booting on 712/60]
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines wrote:
> 
> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > Helge Deller <deller@gmx.de> writes:
> >
> > > I'm seeing the same here. The kernel switches independend of your
> > > kernel-settings (STI-Console - no STI-Console) to serial-console and just
> > > puts some of it's error-messages to the STI-console.
> > > If you don't have a nullmodem cable, you could try to ping/telnet your
> > > parisc, to see if it's still alive.
> > > I currently don't know which change in CVS disallowed us to use just
> > > STI-Console, but will try to figure out later today.
> >
> > Very strange, because it worked for me.  But perhaps I had a magical
> > combination of .config settings that eludes others.
> 
> Well, I can't reproduce this on my 712/80 with either sticon or stifb.
> I've attached my .config for sticon.
> 
>   ------------------------------------------------------------------------
>                                Name: config-sti-not-borken
>    config-sti-not-borken       Type: Plain Text (text/plain)
>                         Description: config
> 
>   ------------------------------------------------------------------------

After looking at dhd's config I think my problem may be just due to
stupidity on my part. I don't know anything about hp's and have just had
my hp for about three days now. Knowing nothing about hp's I just used
the default config for linux and that is prob where the problem is.
Anyway I will compile a new kernel and get back to you on this.

Thanks,
James

-- 
Can you discern the signs of the times? || www.danielrevelation.com
Do you see the storm fast approaching?  || www.sundaylaw.com
Is your future built on "The Rock"?     ||
www.bibleinfo.com/sc/toc_sc.html
