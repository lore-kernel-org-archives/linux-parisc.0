From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Tue, 21 Jun 2005 11:21:58 -0400 (EDT)
Message-ID: <200506211521.j5LFLwgJ011696__38288.3194754415$1416623808$gmane$org@hiauly1.hia.nrc.ca>
References: <20050621024438.GP5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: binutils@sources.redhat.com,
 hjl@lucon.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050621024438.GP5269@systemhalted.org> from "Carlos O'Donell"
	at Jun 20, 2005 10:44:40 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Jun 20, 2005 at 03:46:10PM -0700, H. J. Lu wrote:
> > > Regardless of wether or not I export all global symbols in main, I must
> > > still emit OPD relocs in the executable for all dynamic symbols. In the
> > 						^^^^^^^^^^
> > 
> > Did you mean dynamic or global? There is a big difference. In your
> > proposal, you said "We want to generate a PLABEL32 (OPD reloc) against
> > all global symbols,". I am not familiar with HPPA. I just want to know
> > what you have in mind.
> 
> Sorry for being sloppy, there is a qualifier in my mind that I keep
> forgetting to write, read the following:
> 
> ld must emit an OPD reloc in the executable for each global symbol that
> had an OPD reloc to begin with. This way the dynamic loader can assign
> an OPD at runtime for use in a comparison. Dynamic symbols that had an
> OPD reloc should also emit the reloc in the executable.

There is a difference between ia32 and hppa.  As you note, global
symbols are not automatically exported on ia32, even when the symbol
is used in a function-pointer comparison.  This is possible because
ia32 doesn't use function descriptors.

However, on hppa, GCC generates a PLABEL32 relocation when a function
symbol is used in a comparison.  If this relocation resolves to a
non-unique function descriptor in the PLT, then we get comparison
errors when symbols get passed between shared and main for comparison.
As a result, hpux and linux currently have magic functions to
canonicalize function pointers.  Aside from this being inefficient,
it also causes issues for building kernel software (i.e., canonicalization
is only applicable to user space).

Having the PLABEL32 relocation resolve to an OPD appears to require
that the symbol be exported.  As a result, we have a different behaviors
for dlsym on hppa and ia32.  What's ia64 do?

Under hpux, in a 32-bit link or a +compat mode 64-bit link, ld marks
only those symbols symbols that are actually referenced by a shared
library seen at link time for export.  In a 64-bit +std link, all symbols
are exported by default.  However, explicitly exporting symbols has
the side effect that the symbols will not be removed when using dead
code elimination.

>>From my standpoint, I would like to see the same behavior for both
32 and 64-bit links when hppa linux supports both 32 and 64-bit 
user spaces.  The original linux implementation was modelled on hpux
but over the years we have found that hpux compatibility isn't
important.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
