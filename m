From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 26 Mar 2005 09:55:21 +0100
Message-ID: <16965.9081.148972.856329@gargle.gargle.HOWL>
References: <kfhwtrx2myr.fsf@csclub.uwaterloo.ca>
	<200503241619.j2OGJScZ000411@hiauly1.hia.nrc.ca>
	<20050324165947.GA29361@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050324165947.GA29361@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant Grundler writes:
> On Thu, Mar 24, 2005 at 11:19:28AM -0500, John David Anglin wrote:
> ...
> > From a PA standpoint, GCC 4 is ready for serious testing.  All testsuite
> > bugs have been squashed in C and C++.
> 
> Is there a .deb or tarball available I can drop on a bunch of machines?

- gcc-snapshot can be found in unstable, although it was pointed out,
  it's not that recent (I can't upload this one every week without the
  risk beeing killed by buildd admins for slower architectures ;)

- You can get gcc-4.0 packages from experimental, just add
  deb http://http.us.debian.org/debian experimental main contrib
  to /etc/apt/sources.list.
  Provided that somebody is building and uploading these ...

Besides the recent gcc-snapshot build failure, I'm having problems
building the packages at all at the moment, there's no difference
using between sarge and unstable.

- if the build succeeds, every test case in the testsuite fails, due
  to expect(?) problems. lamont told me that's reproducible on another
  A500, seeing some messages on the serial console, but I can't see
  these messages. I'm currently running the A500 kernels from the
  parisc archives. palinux-a500-defconfig-2.6.{8.1-pa11,11-pa2,12-rc1-pa1}
  all show the same behaviour.

- The libjava build sometimes fails with an sh/bash error. Restarting
  the build usually fixes this.

- gnat doesn't build, even if you include some prebuilt files (which
  might be wrongly generated) from another build.

Besides these minor issues, the packages should be fine.

	Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
