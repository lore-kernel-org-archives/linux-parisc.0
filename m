From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
Date: Sun, 5 May 2002 14:30:04 +0200
Message-ID: <15573.9676.353830.793928__13583.8298629553$1416621275$gmane$org@gargle.gargle.HOWL>
References: <15571.50195.280071.792305@gargle.gargle.HOWL>
	<m38z6z2igh.fsf@mira.informatik.hu-berlin.de>
	<20020505065653.GA12097@nevyn.them.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Martin v. Loewis" <martin@v.loewis.de>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org
To: Daniel Jacobowitz <dan@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020505065653.GA12097@nevyn.them.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Daniel Jacobowitz writes:
> On Sun, May 05, 2002 at 08:54:06AM +0200, Martin v. Loewis wrote:
> > Matthias Klose <doko@cs.tu-berlin.de> writes:
> > 
> > > I would like to get feedback, on which alternative to base the gcc-3.1
> > > packages:
> > > 
> > > a) 3.1 as to be released (without dwarf2 support)
> > 
> > As Redhat has demonstrated in the past, it is highly desirable that
> > the distributed gcc is based on a released gcc as close as possible.
> > If there are serious problems in gcc 3.1-as-released, work with gcc
> > maintainers to fix them in 3.1.1.
> 
> Completely seconded.  I want the collection of patches that
> distributors ship with GCC to shrink over time, not grow...

I see, I was unclear, the alternatives were hppa specific, I didn't
even think of using anything else than the release ...
