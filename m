From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] binutils 2.15?
Date: Mon, 21 Jun 2004 11:18:00 -0400
Message-ID: <20040621151800.GC16360__19142.0513125651$1416624455$gmane$org@baldric.uwo.ca>
References: <40BDA020000074B9@ocpmta3.freegates.net>
	<200406140409.i5E49HYi003897@hiauly1.hia.nrc.ca>
	<20040614032519.GS5191@sunsite.ms.mff.cuni.cz>
	<20040614120820.GG28716@bubble.modra.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Alan Modra <amodra@bigpond.net.au>,
 Jakub Jelinek <jakub@redhat.com>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org,
 binutils@sources.redhat.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040614120820.GG28716@bubble.modra.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> There's a lazy linking stub inserted at the end of the .plt section that
> loads the .got address by
> 
>   b,l	1b,%r20
>   depi	0,31,2,%r20
> 
> ie. it depends on .got immediately following these instructions.

My apologies for a tardy reply.

We don't *have* to depend on the .got immediately following these
instructions. Technically we look for a signature at the end of the PLT.
The code in glibc looks beyond the last relocation in the following 
equation:

ptr = reloc->r_offset + l_addr + PLT_ENTRY_SIZE + SIZEOF_PLT_STUB

And if it finds the signature at ptr[-2] and ptr[-1], then it
acknowledges that as the PLT stub. It then by proxy knows that the GOT
should be at ptr[0], but it doesn't have to rely strictly on this, I'm
more than willing to add more code to glibc to remove this restriction.

I just don't really know how other arches find the GOT at this early 
stage in ld.so's startup (e.g. elf_machine_runtime_setup()).

The only reason we use the GOT here is because we want to identify the
shared object by storing a pointer to the DSO link_map into GOT[1]. 
Which to tell you the truth, I'm sure has to do with something in 
binutils that I currently don't understand.

I'm slowly reviewing the binutils hppa code because I'd like to clean it
up / understand it enough to add TLS.

Jakub, I hope this helps, if someone has an idea then I would be more
than happy to implement the change and test the resulting
binutils/glibc.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
