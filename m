Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA01159
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:26 -0700
Date: Sat, 6 Nov 1999 19:18:10 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recent changes
Message-Id: <19991106191810.E11609@mathe.stud.uni-erlangen.de>
References: <199911030250.TAA16563@puffin.external.hp.com> <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com> <19991103133628.G25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991103133628.G25252@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> I've changed it to call sys_brk instead; I'm not quite sure why I had
> thought it would need to call a different function, brk looks identical
> to me on both OSes.

It isn't.  HP/UX brk seems to be equivalent to sys_brk(addr + PAGE_SIZE), i.e.
while Linux gets passed a pointer to the first byte after the end of the brk'd
segment, HP/UX brk gets passed a pointer to the first byte of the last page of
it.  At least, this seemed to be the case for our first binaries.

	Philipp Rumpf
