Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AD5A4919
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 01:01:22 -0600 (MDT)
Date: Tue, 27 Apr 2004 08:01:14 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Linux-2.6.6-rc1-pa3 and pdflush problems
In-Reply-To: <408D43600000047B@ocpmta1.freegates.net>
Message-ID: <Pine.LNX.4.58.0404270758490.1486@sal.ucc.ie>
References: <408D43600000047B@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 27 Apr 2004, Joel Soete wrote:

> > Unfortunately I just switched to the 2.6 kernel (for permanent use) recently,
> > so I'm not know whether this error would have happened with a
> > pre-2.6.6-rc1 kernel aswell.
>
> uhm the http://cvs.parisc-linux.org/download/linux-2.6/patch-2.6.5-pa8.gz
> patch could always help you to rebuild this previous 2.6.6 kernel from upstream
> src ;)

Thanks, I'll give it a try ...

> PS: on my b2k (the brother model of c3k) I am running a 2.6.6-rc1-pa0 for
> an uptime of 11days without any major pb. (well always some small hung of
> some minutes because of scsi bus reset from time to time but no major issue).
> But I have no additional gfx, no ide hd (just a cdrom drive) and I only use
> serial console (so I couldn't help you more)

BTW,
This time it didn't take several hours, but merely a couple of minutes;
what I did was starting several downloads (onto a ext3 on /dev/hda1),
and then opening up a couple of websites in konqueror (which in turn uses
the proxy that also access /dev/hda1)


Again pdflush was consuming 100%, but this time I waited about 5mins and
pdflush behaved normal again ... just to start again later and disappear
again ...

I still have see the following messages on the serial console:

hda: lost interrupt
hda: dma_timer_expiry: dma status == 0x64
hda: DMA interrupt recovery

and also the same symptoms as before (network is working normal, USB
keyboard/mouse don't work). If you respond fast what commands I should
run, I can give you more info ...


Thanks,
   Max
