Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA09291
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 21:48:46 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 20 Aug 2000 03:48:35 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 20 Aug 2000 03:48:05 -0000
Date: Sat, 19 Aug 2000 22:43:36 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
Message-ID: <20000819224336.G32273@vodka.thepuffingroup.com>
References: <87r97kzzbe.fsf@linuxcare.com> <Pine.LNX.4.21.0008201303120.26467-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0008201303120.26467-100000@front.linuxcare.com.au>; from Alan Modra on Sun, Aug 20, 2000 at 01:07:13PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 20, 2000 at 01:07:13PM +1000, Alan Modra wrote:
> On 19 Aug 2000, David Huggins-Daines wrote:
> 
> > This chunk needs to also check for undefined symbols, it seems.
> > Here's a better one:
> 
> cvs update.  I think I've done things properly this time, although you'll
> no doubt find some silly bugs left when you actually run code on real
> hardware.
> 
> BTW, Adding "-p" to your diff options would be a good idea.

so here's a .cvsrc file which should help people:

cvs -z3 -q
diff -uNp
update -Pd
rm -f

btw, is there any option to cvs diff which produces files which can be
applied by any known version of patch?  in my experience, patch can't
find files specified by Index: lines _unless_ both the +++ and the ---
files can't be found -- which is rarely the case with common names such
as Makefile or ChangeLog.  I hacked a copy of patch myself to apply one
of the cvs diff patches you posted here, but there surely has to be a
better way (complaining to Paul Eggert that while patch may or may not be
POSIX or GNU compliant it isn't _USEFUL_ may be the right answer here :-)

-- 
Revolutions do not require corporate support.
