Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA22148
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 19:58:18 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Aug 2000 19:58:35 -0000
To: Dave Gilbert <gilbertd@treblig.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Just felt like sharing...  (no pun intended)
References: <Pine.LNX.4.10.10008122018090.764-100000@tardis.home.dave>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Aug 2000 15:58:22 -0400
In-Reply-To: Dave Gilbert's message of "Sat, 12 Aug 2000 20:22:17 +0100 (BST)"
Message-ID: <87zomil09t.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Dave Gilbert <gilbertd@treblig.org> writes:

> Good work!

Well, Alan Modra did most of the work.  Getting binutils up to snuff
was certainly a lot more complicated than writing a few lines of
assembly code in dl-machine.h :-)

> > There's still a lot of work to be done, of course - glibc doesn't
> > completely build with --enable-shared yet, and libdl.so is going to be
> > somewhat more challenging (luckily the IA-64 people have already
> > encountered some of the same issues).  Also note the kludgy way we
> > have to explicitly link libgcc.a, which was mentioned in a previous
> > thread.
> 
> Also Linux/Alpha probably has most of the same issues solved for a long
> time.

Not really, because on Alpha, function pointers are actually function
pointers, branches are longer than 256K, the linker and the assembler
know how to give you the offset from the GP to the PC, all code is
PIC, and perhaps most importantly, Digital Unix's runtime architecture
is reasonably sane ;-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
