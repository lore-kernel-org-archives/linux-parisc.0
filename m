Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA30140
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 17:05:43 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Jul 2000 23:07:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA12869;
	Fri, 7 Jul 2000 09:06:26 +1000
Date: Fri, 7 Jul 2000 09:06:26 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Another possible linker problem
In-Reply-To: <E13AEnD-0000ju-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0007070848540.12175-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

[cc to list in case others have the same problem.]

On Thu, 6 Jul 2000, Paul Bame wrote:

> I tried to x-compile ncurses-5.0 and the executables (tic, clear, tput,
> and so forth) will not link.  They seem to be created from a couple of
> large .o files, produced from 'ld -r' I think.  Here're the messages:
> 
> hppa1.1-linux-gcc ../objects/tic.o ../objects/dump_entry.o -L../lib -L/usr/lib -lncurses      -o tic
> /home/bame/xc/lib/gcc-lib/hppa1.1-linux/2.96.0614/../../../../hppa1.1-linux/bin/ld: can not size stub section: Bad value

I reckon this error is probably fixed by the patch I checked in last
night.  elf32_hppa_size_stubs had this code in it

		      if (hash->root.type == bfd_link_hash_undefined
			  || hash->root.type == bfd_link_hash_undefweak)
			continue;

		      while (hash->root.type == bfd_link_hash_indirect
			     || hash->root.type == bfd_link_hash_warning)
			hash = (struct elf_link_hash_entry *)
			  hash->root.u.i.link;

and the problem is that we may have an indirect symbol (results from
symbol versioning) pointing to an undefined symbol.  The simple fix is to
traverse the indirect links before checking for undefined syms.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
