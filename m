From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Wed, 16 Mar 2005 16:37:58 -0500
Message-ID: <20050316213757.GG22872@baldric.uwo.ca>
References: <20050315220842.GC22872@baldric.uwo.ca>
	<200503160410.j2G4ALcu021219@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 amodra@bigpond.net.au,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503160410.j2G4ALcu021219@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 15, 2005 at 11:10:21PM -0500, John David Anglin wrote:
> > No. Read further, if I'm wrong please correct me.
> > 
> > The PLABEL32 contains the address of the function descriptor, while the
> > data in the PLT *is* the function descriptor. There is an extra lookup.
> > 
> > You have to load the address of the PLABEL32, load the value from there,
> > and then use that as your function descriptor. We currently *don't* do
> > this. The reason the indirection is there for PLABEL32 is such that the
> > dynamic loader can acutally assign the address of the OPD into that
> > word. 
> 
> No, I don't believe this is correct.  We do load the address
> from the PLABEL32 word.  That's the function pointer and what's
> passed to __cffc.  The problem is we don't have an OPD for the
> functions called in this manner.  We have more than one function
> descriptor for a any given function (possibly one for every
> PLABEL32 relocation).

We *do* have a n OPD for functions called in this manner, but only if
the plabel word carried a PLABEL32 reloc. The use of _dl_make_fptr
makes sure each symbol gets a unique function descriptor and will never
create duplicates.

The problem is that in the executable, we lazily point all the plabel
words at their associated plt entries and *splat* they are no longer
unique. Please note this *only* happens in the executable. Executables
do not generate PLABEL32 relocs for their plabel words.

I want to recommend that the executable emit PLABEL32 relocs against all
plabel word entries. The dynamic loader would then fill these entries
with unique OPD's as it has done so for shared libraries (this code was
originall wirtten by Bame et. al. and I ported hppa to use Lu's
non-locking generic version).
 
> On hppa64-hpux, we use essentially the same code to load function
> pointers from FPTR64 double words.  There we don't need to
> canonicalize the pointers because they point to the OPD for the
> function.

Sure, but the hpux libc probably does all the work to make sure that the
plabel words point to OPD's even for the executable :)

> > The problem is that in a normal executable those words just point at the
> > PLT and they shouldn't. That case should just generate a PLABEL32 reloc
> > in the executable. 
> > 
> > Do I understand the code correctly?
> 
> I think the situation envisioned in the parisc elf specification
> always envisioned a two level lookup.  In the relocations defined
> for 32-bit elf, the only way to load the address of a function
> descriptor is using the PLABEL32 relocation.  The 64-bit elf
> table also provides the LTOFF_FPTR21L and LTOFF_FPTR14R relocations.
> In this case, I believe that code has to load the address of the function
> descriptor from the linkage table, so it's still a two level lookup.

Yes, correct, I agree. Loading the *address* of a function descriptor
always requires a PLABEL32 reloction. The PLABEL32 reloction is handled
by the dynamic loader, which creates the OPD, and places the address of
the OPD into the plabel word.

Yes, as long as LTOFF_FTPR* load the address of the descriptor from the
linkage table (plt) then the system still works.

Hence, why I suggest executables also use PLABEL32 relocs if they take
the address of a function.

> The 32-bit ABI has the complication of the plabel bit in the function
> pointer.  While it might be possible to directly load the address
> of the function descriptor with an addil/ldo sequence if suitable
> relocations existed, saving one memory access, the code would still
> have to call $$dyncall or perform equivalent operations inline to
> test and strip off the plabel bit.

Yes, calling a function descriptor will always involve clearing the
plabel bit. I don't quite understand the performance gain to be made in
detecting that the plabel word contained a local address as opposed to a
function descriptor?

Yes, with a new relocation it *might* be possible to load the function
descriptor address directly from the plabel word, but as you say it 
would require writing into the code to change offsets?

> There are several disadvantages in the approach.  Plabels and linkage
> table entries can be shared for many calls to a given function.  Thus,
> the dynamic loader probably has an easier job doing the relocations.
> Also, I think that relocations might have to be redone (at least under
> hpux) when shared libraries are dynamically loaded by an application.
> This would require that the dynamic loader have the capability to
> write to code space after a program has started execution.  This is
> probably a security risk, particularly for shared libraries that are
> not privately mapped.  As I noted previously, the plabel words have
> to go in a read/write section because of this issue.

Do you really mean "disadvantages?"

Can you explain how plabels and plt entries can be shared for many calls
to a given function?

Are we still talking about the new reloc that could load the function
descriptor address directly?

Yes, plabel words go in read/write since they are written to by the
dynamic loader (only if they have a PLABEL32 reloc though).

---

This has definately been a good learning discussion, from the viewpoint
of optimal schemes for this type of architecture :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
