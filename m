From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils 2.15?
Date: Sun, 27 Jun 2004 23:25:28 -0400 (EDT)
Message-ID: <200406280325.i5S3PSrM020383__7970.25033175505$1416624458$gmane$org@hiauly1.hia.nrc.ca>
References: <20040621151800.GC16360@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: jakub@redhat.com,
 binutils@sources.redhat.com,
 amodra@bigpond.net.au,
 parisc-linux@parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040621151800.GC16360@baldric.uwo.ca> from "Carlos O'Donell" at
	Jun 21, 2004 11:18:00 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > There's a lazy linking stub inserted at the end of the .plt section that
> > loads the .got address by
> > 
> >   b,l	1b,%r20
> >   depi	0,31,2,%r20
> > 
> > ie. it depends on .got immediately following these instructions.
> 
> My apologies for a tardy reply.
> 
> We don't *have* to depend on the .got immediately following these
> instructions. Technically we look for a signature at the end of the PLT.
> The code in glibc looks beyond the last relocation in the following 
> equation:
> 
> ptr = reloc->r_offset + l_addr + PLT_ENTRY_SIZE + SIZEOF_PLT_STUB
> 
> And if it finds the signature at ptr[-2] and ptr[-1], then it
> acknowledges that as the PLT stub. It then by proxy knows that the GOT
> should be at ptr[0], but it doesn't have to rely strictly on this, I'm
> more than willing to add more code to glibc to remove this restriction.

>>From my perspective, we need binutils to work with existing versions
of glibc.  While Carlos' offer to work on removing the restriction is
commendable, the details of this haven't been worked out or tested.
I believe that we need GOT after PLT until the glibc changes are
available and widely distributed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
