From: Alan Modra <amodra@bigpond.net.au>
Subject: [parisc-linux] Re: OPD's on hppa-linux,
	and what to do about __cffc's fragility.
Date: Fri, 11 Mar 2005 08:57:51 +1030
Message-ID: <20050310222751.GE7616@bubble.modra.org>
References: <20050308175445.GV23803@baldric.uwo.ca>
	<200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
	<20050308210851.GA23803@baldric.uwo.ca>
	<20050308222513.GF15642@bubble.modra.org>
	<20050310153120.GJ22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050310153120.GJ22872@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 10, 2005 at 10:31:20AM -0500, Carlos O'Donell wrote:
> On Wed, Mar 09, 2005 at 08:55:13AM +1030, Alan Modra wrote:
> > No, in an hppa-linux shared lib, a function pointer is accessed via a
> > word with a PLABEL32 reloc on it.  This reloc is processed before any
> > code in the shared lib runs, to point to a function descriptor created
> > by _dl_make_fptr.
> 
> In shared libraries the function pointer is also allocated a PLT slot
> and an IPLT relocation. 
> 
> I don't understand the reasons for the allocation of a PLT slot if all
> references generated go through the local label word that has the
> PLABEL32 reloc, which now contains the address returned by
> _dl_make_ftpr.

There probably isn't a good reason.  Blame that on me not understanding
what I was doing when dhd and I hacked together ld and glibc hppa-linux
support.

> I'm still trying to understand your earlier recommendation. Do you
> suggest that the executable have PLABEL32 relocs for all the symbols,
> local and global, which assures that _dl_make_fptr creates a unique OPD?

I was really just thinking of global symbols.  If ld handles descriptors
for locals, you save on dynamic relocs and program startup time.  I
haven't spent a great deal of time thinking about it though, so it's
highly likely that there is some reason why it won't work.  eg. You
wouldn't want dynamic plabel relocs to appear in read-only sections.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
