Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD67C4840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Jan 2004 11:54:47 -0700 (MST)
Date: Fri, 23 Jan 2004 19:54:44 +0100
Message-ID: <400D3BEE0000294D@ocpmta1.freegates.net>
In-Reply-To: <20040122053112.GB6468@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Just need more advise (sorry)

>It's the other way around. pdc_suspend_usb() is breaking PDC_CONSOLE.
>See email related to linux-2.6 c3000 serial console problems late last year.

Ok I find relevant info and pdf docs (in fact I missed 'data_formats.pdf'
to make the bridge :( )

>AFAIK, the memcpy just enables the PDC to use a serial console.

Hmm we didn't 'relocate' PDC (as see hpux makes), so all those information
are fill in by PDC prgm itself? So if Console is flagged CL_DUP, I don't
see why do we have to make this memcpy?

>But pdc_suspend_usb() apperently blows away the whole suckyio chip
>and thus PDC can no longer use suckyio serial either. Hrmm..I thought
>there was a IO_RESET_AND_CLEAR pdc call in that same chunk of code.

>Anyway, Figuring out some additional info could help:
>   (a) know which devices migh have DMA enabled when the OS gets control

May be the console itself (by continuously reading the kdb eg)?

>   (b) disable just the DMA
where should I look to disable so console dma?
[if I well understand spinlock_... and unlock function are not foreseen in
that case but more to avoid 2 different cpu to access a same ressource.
May be better something similar to [acquire,release]_console_sem?]

>   (c) detect when PDC_CONSOLE wants to use a device whose DMA we've disabled

Thanks in advance for additional help,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
