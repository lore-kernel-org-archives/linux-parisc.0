Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA29570
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 02:41:21 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Oct 2000 08:42:53 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA13662;
	Thu, 26 Oct 2000 19:41:05 +1100
Date: Thu, 26 Oct 2000 19:41:05 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com, opensource@cup.hp.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: [parisc-linux] hppa64-linux gcc bug
In-Reply-To: <Pine.LNX.4.21.0010261812440.31251-101000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010261922550.31251-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 26 Oct 2000, Alan Modra wrote:

> On Wed, 25 Oct 2000, Grant Grundler wrote:
> 
> > Though this seems like a "generic" hppa bug to me, I doubt it's
> > in the currently published hppa2.0-hpux toolchain.
> > 
> > [ Note : hppa64-linux tool chain isn't fully merged up with the
> 
> The bug manifests itself on today's CVS gcc from sourceware.
> .../configure --host=i686-linux --target=hppa64-linux

Errm, how embarrassing.  Instead of "today's CVS gcc" I configured from
the puffin gcc tree.  Alert readers probably can see that from the
hppa64-linux target I used above.  Trying again, this time using the right
gcc source with --target=hppa64-hpux11 is even worse though.  The same
sort of bug exhibits itself in proc_symlink, _and_ I get a segmentation
fault.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
