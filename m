Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA27128
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 09:25:55 -0600
Received: from ottawa.linuxcare.com (HELO localhost.localdomain) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 4 Jul 2000 15:27:16 -0000
Date: Tue, 4 Jul 2000 10:21:54 -0400
From: willy@thepuffingroup.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
Message-ID: <20000704102154.Q12436@vodka.thepuffingroup.com>
References: <E135Dev-0007ho-00@noam.fc.hp.com> <Pine.LNX.4.21.0006231116510.24137-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0006231116510.24137-100000@front.linuxcare.com.au>; from Alan Modra on Fri, Jun 23, 2000 at 11:45:16AM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 23, 2000 at 11:45:16AM +1000, Alan Modra wrote:
> No, gcc doesn't need to be rebuilt.  The problem here (I think - I'm going
> to build a kernel in a the moment) is the silly use of "ld -r" in the
> kernel build process.  This has the unfortunate effect of concatenating
> all the .text sections, making some too large for a branch to reach its
> stub section.  Of course this same thing can happen with very large object
> files.
> 
> One fairly simple work-around is to use -ffunction-sections when compiling,
> as then you need a truely enormous function (> 4*2**(17-1) bytes long)
> before you'll get "cannot reach stub"  Also, gcc has support for handling
> even these enormous functions.

how about 
  --split-by-reloc COUNT      Split output sections every COUNT relocs
would that help?

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
