From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] Re: Bug#342545: qt-x11-free FTBFS
Date: Wed, 23 Aug 2006 10:39:04 +0200
Message-ID: <17644.5160.464612.203605__12545.6380461857$1416624155$gmane$org@gargle.gargle.HOWL>
References: <877j1ug3tu.fsf@nahar.marcbrockschmidt.de>
	<200608061403.30923.chrsmrtn@debian.org>
	<20060810042506.GP6949@mauritius.dodds.net>
	<200608101952.41156.chrsmrtn@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 342545@bugs.debian.org,
 debian-release@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Christopher Martin <chrsmrtn@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608101952.41156.chrsmrtn@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The qt-x11-free package builds fine with a standard Debian setup.
Building with prctl --unaligned=signal makes the "bug" reproducible.

Christopher Martin writes:
> reassign 342545 libgcc2
> stop
> 
> On Thursday 10 August 2006 00:25, Steve Langasek wrote:
> > It hasn't been, because I can't see any way that libglu1-mesa could
> > have anything to do with the failure in question.  libglu1-mesa
> > should not be a dependency of the tool that's failing with SIGBUS in
> > the build log.
> >
> > I would suggest that someone should investigate this further and get
> > a clear answer on the nature of the bug, because I really don't buy
> > that libgcc skew is to blame.
> 
> Fair enough, but before I take off for the weekend, I'm sending this 
> report back to libgcc2, since it seems to have been established long 
> ago that this isn't a Qt bug, and it really should be assigned to 
> something in the toolchain. I note that, for a time, the problem was 
> thought to be in glibc, so perhaps the glibc team would again be worth 
> consulting.
> 
> Cheers,
> Christopher Martin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
