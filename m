Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2DD0E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 19:30:07 -0600 (MDT)
Message-Id: <200306260130.h5Q1U2x4009324@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: binutils ICE while building todays gcc HEAD on hppa-linux
To: amodra@bigpond.net.au (Alan Modra)
Date: Wed, 25 Jun 2003 21:30:02 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: doko@cs.tu-berlin.de, parisc-linux@lists.parisc-linux.org,
	binutils@sources.redhat.com
In-Reply-To: <20030626003652.GQ4022@bubble.sa.bigpond.net.au> from "Alan Modra" at Jun 26, 2003 10:06:52 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Wed, Jun 25, 2003 at 11:26:59PM +0200, Matthias Klose wrote:
> > ICE in binutils-2.14.90.0.4 building gcc HEAD 20030625, while linking
> > the shared libstdc++ library:
> > 
> > [...]
> > -Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.0
> > /usr/bin/ld: BFD 2.14.90.0.4 20030523 Debian GNU/Linux internal error, aborting at ../../bfd/elf32-hppa.c line 3864 in elf32_hppa_relocate_section
> 
> Please run the ld command under gdb, and let me know the results of
> "p *h".  Note that you may need to recompile elf32-hppa.c at -O1 to
> get useful debug info.

Oh, I had already done that yesterday.  h is NULL.  The enclosed patch
avoids the problem but a better fix would be to somehow remove local
PLABEL relocations for symbols in linkonce sections.  In this particular
case, we have a linkonce section in io-inst.o that duplicates a pervious
one in fstream-inst.o.

If Jakub comes up with a patch to output the thunks for a function before
the function instead after the function, I will change the thunk generation
in gcc to use a simple pc-relative branch to the function.  This will
avoid the problem.  However, at the moment, we are not guaranteed that
a pc-relative branch has sufficient range to reach the function.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.100
diff -u -3 -p -r1.100 elf32-hppa.c
--- elf32-hppa.c	25 Jun 2003 06:40:21 -0000	1.100
+++ elf32-hppa.c	26 Jun 2003 01:15:09 -0000
@@ -3807,6 +3807,9 @@ elf32_hppa_relocate_section (output_bfd,
 			  do_plt = 1;
 			}
 		    }
+
+	          if (off >= (bfd_vma) -2)
+		    break;
 		}
 	      else
 		{
@@ -3828,6 +3831,12 @@ elf32_hppa_relocate_section (output_bfd,
 		      local_plt_offsets[r_symndx] |= 1;
 		      do_plt = 1;
 		    }
+
+		  /* ???: Ignore PLABEL relocations for local symbols
+		     with an undefined offset.  This can happen if the
+		     symbol was in a linkonce section.  */
+	          if (off >= (bfd_vma) -2)
+		    break;
 		}
 
 	      if (do_plt)
@@ -3859,9 +3868,6 @@ elf32_hppa_relocate_section (output_bfd,
 				  htab->splt->contents + off + 4);
 		    }
 		}
-
-	      if (off >= (bfd_vma) -2)
-		abort ();
 
 	      /* PLABELs contain function pointers.  Relocation is to
 		 the entry for the function in the .plt.  The magic +2
