Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA26997
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 01:33:41 -0600
Received: from whitetower (modem-0122.rns.tamu.edu [165.91.64.185])
	by mail.tamu.edu (8.9.0/8.9.0) with SMTP id CAA10980
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Jun 1999 02:33:37 -0500 (CDT)
Message-Id: <3.0.5.32.19990620023233.008f38a0@pop.tamu.edu>
Date: Sun, 20 Jun 1999 02:32:33 -0500
To: parisc-linux@thepuffingroup.com
From: Jack Perdue <j-perdue@tamu.edu>
Subject: Re: [parisc-linux] strace/truss/par equivalent for HP-UX
In-Reply-To: <19990620084918.H30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

At 08:49 AM 6/20/99 +0200, MW wrote:
>
>I've found trace for HP-UX 10.20 (and 10.10, 9.x) on ftp.interworks.org
>(as recommended by the HPUX FAQ), however it doesn't appear to have been
>updated for HP-UX 11.  What do you guys at HP use to trace programs?


FWIW, you can try tusc at:

 ftp://ftp.cup.hp.com/dist/networking/misc/         ^[1]

jack [who has no idea whether guys at HP use such a thing]
j-perdue@tamu.edu


[1]

>From: foo@bar.baz (Rick Jones)
>Newsgroups: comp.sys.hp.hpux
>Subject: new version of syscall tracing tool on ftp.cup.hp.com
>Date: 19 Apr 1999 18:36:25 GMT
>Organization: the Unofficial Hewlett-Packard
>Lines: 16
>Message-ID: <7fft39$3ha$2@ocean.cup.hp.com>
>NNTP-Posting-Host: loiter.cup.hp.com
>Summary: A new version of tusc, a tool for system call tracing, is available
>Keywords: tusc, trace, truss
>X-Newsreader: TIN [version 1.2 PL2.13]
>Xref: news.tamu.edu comp.sys.hp.hpux:105999
>
>Folks
>
>Tusc is a trace/truss-like system call tracing tool for HP-UX 11. 
>
>The author of tusc has made further enhancements to the tusc syscall
>tracing tool. They are in the area of improving the tracing of large
>numbers of processes.
>
>The copy of tusc at ftp://ftp.cup.hp.com/dist/networking/misc/ has
>been updated.
>
>rick jones
>--
>these opinions are mine, all mine; HP might not want them anyway... :)
>feel free to email, or post, but please do not do both...
>my email address is raj in the cup.hp.com domain...
