Return-Path: <doko@cs.tu-berlin.de>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB77B4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 16:41:18 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16416.12461.599235.278205@gargle.gargle.HOWL>
Date: Wed, 4 Feb 2004 00:37:17 +0100
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in hppa's glibc.
In-Reply-To: <20040203055045.GC11884@baldric.uwo.ca>
References: <20040131222832.GB19840@baldric.uwo.ca>
	<20040203055045.GC11884@baldric.uwo.ca>
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos O'Donell writes:
> The patch below *can* still go into gcc, and will speedup __cffc when running
> with the new glibc.
> 
> The above changes are added into the latest glibc patches at:
> http://www.parisc-linux.org/~carlos/glibc-hppa-patches-latest.tar.gz
> 
> 
> > 2004-01-31  Carlos O'Donell  <carlos@baldric.uwo.ca>
> > 
> > 	* gcc/config/pa/fptr.c (__canonicalize_funcptr_for_compare): Add
> > 	extra offset check for new glibc TRAMPOLINE_TEMPLATE.
> > 
> > Index: gcc/config/pa/fptr.c
> > ===================================================================
> > RCS file: /cvs/gcc/gcc/gcc/config/pa/fptr.c,v
> > retrieving revision 1.2
> > diff -u -p -r1.2 fptr.c
> > --- gcc/config/pa/fptr.c	9 Dec 2002 19:16:14 -0000	1.2
> > +++ gcc/config/pa/fptr.c	31 Jan 2004 22:18:27 -0000
> > @@ -35,7 +35,7 @@ Boston, MA 02111-1307, USA.  */
> >     the template should it be necessary to change the current branch
> >     position.  */
> >  #define NOFFSETS 2
                     ^^^ ?
> > -static int fixup_branch_offset[NOFFSETS] = { 32, -4 };
> > +static int fixup_branch_offset[NOFFSETS] = { 36, 32, -4 };
