Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA19476
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 11:25:28 -0600
From: Steven Pritchard <steve@osiris.silug.org>
Message-Id: <199906151725.MAA11161@osiris.silug.org>
Subject: Re: [parisc-linux] Compiling Linux Kernel on HP-UX
In-Reply-To: <199906151031.MAA12339@pallas.spacetec.no> from Tor Arntsen at "Jun 15, 99 12:31:47 pm"
To: tor@spacetec.no (Tor Arntsen)
Date: Tue, 15 Jun 1999 12:25:09 -0500 (CDT)
Cc: Ulrich.Strelow@Schering.DE, parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Tor Arntsen said:
> On Jun 15, 11:26, Ulrich.Strelow@schering.de wrote:
> >I am running HP-UX 10.20, so I cannot use the depots from
> >ftp://puffin.external.hp.com/pub/parisc/binaries/depot/.
> >So the question is: do I need gcc 2.8.1 and binutils 2.9.1 to build the
> >kernel on HP-UX or is this some other error ?
> 
> I'm pretty sure you need the hacked egcs and binutils.  You can check them 
> out of cvs from the same place as the kernel (I use them for cross-compiling 
> though).

I suppose I should mention that the only reason I chose to compile gcc
2.8.1 and binutils 2.9.1 was that I was almost positive that gcc 2.8.1
would build with the bundled K&R compiler.  (I couldn't find a copy of
the ANSI C compiler for 11 over the weekend.)  I figured that the
vanilla gcc and binutils would give me enough of a development
environment that I could build anything else.

I have binaries of egcs 1.1.2 built, but I'm going to try to run the
test suite before I put them out on puffin.external.hp.com.  After
that, I'll go for the CVS versions.  When it looks like everything is
built for 11, I'll probably go back and build 10.20 binaries of
anything you can't already find on hpux.cs.utah.edu or
hpux.cae.wisc.edu.

BTW, I've tested the bash binary...  It seems to work fine.

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
