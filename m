From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Fri, 11 Mar 2005 13:05:42 -0500
Message-ID: <20050311180542.GV22872@baldric.uwo.ca>
References: <20050308175445.GV23803@baldric.uwo.ca>
	<200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
	<20050308210851.GA23803@baldric.uwo.ca>
	<20050308222513.GF15642@bubble.modra.org>
	<20050310153120.GJ22872@baldric.uwo.ca>
	<20050310222751.GE7616@bubble.modra.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: Alan Modra <amodra@bigpond.net.au>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050310222751.GE7616@bubble.modra.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 11, 2005 at 08:57:51AM +1030, Alan Modra wrote:
> > In shared libraries the function pointer is also allocated a PLT slot
> > and an IPLT relocation. 
> > 
> > I don't understand the reasons for the allocation of a PLT slot if all
> > references generated go through the local label word that has the
> > PLABEL32 reloc, which now contains the address returned by
> > _dl_make_ftpr.
> 
> There probably isn't a good reason.  Blame that on me not understanding
> what I was doing when dhd and I hacked together ld and glibc hppa-linux
> support.

I understand why you allocate a PLT slot, because function calls seem to
go through the PLT only without reference to the PLABEL32 word (in
shared libraries). This saves an indirection through the PLABEL32 word
during a call. I believe this to be what is happening, and I verfiied it
lightly.

I went through the sources again, and you made some argument in a
comment about passing "local function pointers" to other objects.

The only way to verify my ideas is to run some tests, so here is the
apparent summary.

- Executable passes local function pointer to shared object.
 = Passes the address of the PLT entry.
 = PLT entry has IPLT reloc.

- Shared object passes local function pointer to other shared object.
 = Passes the address of *(PLABEL32 word) which points to a fdesc
   made by _dl_make_fptr.
 = The PLABEL32 word has a PLABEL32 reloc.

- Shared object calls a local or global function.
 = Calls through the PLT, which has an IPLT reloc.

- Executable calls local function.
 = Jumps directly to address.

- Executable calls global function.
 = Uses dyncall on the address of hte PLT
 = PLT has IPLT reloc.

> > I'm still trying to understand your earlier recommendation. Do you
> > suggest that the executable have PLABEL32 relocs for all the symbols,
> > local and global, which assures that _dl_make_fptr creates a unique OPD?
> 
> I was really just thinking of global symbols.  If ld handles descriptors
> for locals, you save on dynamic relocs and program startup time.  I
> haven't spent a great deal of time thinking about it though, so it's
> highly likely that there is some reason why it won't work.  eg. You
> wouldn't want dynamic plabel relocs to appear in read-only sections.

I thought about this, and you are correct. Technically if the shared
object can do a comparison then the symbol must have been global, and
passed into the function.

How do I do this in a backwards compatible way?

Action
=======
If we emit a PLABEL32 reloc for all global symbols in the executable,
baring relocs in read-only sections, which I'm sure shared libraries
have the same problems, then the executable passes the address stored
in the plabel word.

Case 1:
=======
For these new executables gcc will not generate __cffc comparisons.
For new libraries gcc will not generate __cffc comparisons.

Case 2:
=======
Old executables will still pass the address of the plt entry, and
comparisons in new shared libraries will fail.

Case 3:
=======
New executables and old shared libraries will work just fine, since
__cffc will think that everything has been resolved properly and just
do comparison.

Fixes:
======
Transition all executables to use PLABEL32 relocs for global symbols,
the same as shared libraries. Keep gcc generating __cffc.
One day when all the executables have been rebuilt, we can start turning
off the generation of __cffc and "Case 2" will fail, but hopefully we
have transitioned away from that happening.

Thoughts?

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
