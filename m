From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Fri, 11 Mar 2005 19:49:28 -0500 (EST)
Message-ID: <200503120049.j2C0nTDc017666@hiauly1.hia.nrc.ca>
References: <20050311180542.GV22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 amodra@bigpond.net.au,
 parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050311180542.GV22872@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 11, 2005 01:05:42 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Mar 11, 2005 at 08:57:51AM +1030, Alan Modra wrote:
> > > In shared libraries the function pointer is also allocated a PLT slot
> > > and an IPLT relocation. 
> > > 
> > > I don't understand the reasons for the allocation of a PLT slot if all
> > > references generated go through the local label word that has the
> > > PLABEL32 reloc, which now contains the address returned by
> > > _dl_make_ftpr.
> > 
> > There probably isn't a good reason.  Blame that on me not understanding
> > what I was doing when dhd and I hacked together ld and glibc hppa-linux
> > support.
> 
> I understand why you allocate a PLT slot, because function calls seem to
> go through the PLT only without reference to the PLABEL32 word (in
> shared libraries). This saves an indirection through the PLABEL32 word
> during a call. I believe this to be what is happening, and I verfiied it
> lightly.

I believe the PLT exists to support 'LTP and 'RTP relocations.
GCC doesn't generate these relocations as this support doesn't
work under HP-UX, although the HP-UX assembler manual describes
them.  GCC generates 32-bit plabels (deferred) when it encounters
a situation where a 'LTP/'RTP sequence would be desireable.  Thus,
we may not need the PLT slot.

I don't see that a level of indirection is being saved.  We either
go through the PLABEL32 word or the PLT.

I believe that GCC always create the PLABEL32 words in the data
section (definitely true for HP-UX) so that the word can be
successfully relocated when a shared library is loaded.

> I thought about this, and you are correct. Technically if the shared
> object can do a comparison then the symbol must have been global, and
> passed into the function.

I don't think this is correct.  It's theoretically possible to pass
two function pointers that both point to local functions in one object
and have the comparison done in another (shared) object.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
