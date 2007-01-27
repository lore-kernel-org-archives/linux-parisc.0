From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sat, 27 Jan 2007 11:20:19 -0500 (EST)
Message-ID: <200701271620.l0RGKKuW008618__6970.28567451543$1416624269$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440701270805v4ee1f56an4cc578a8f8c1c3cd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701270805v4ee1f56an4cc578a8f8c1c3cd@mail.gmail.com>
	from "Carlos O'Donell" at Jan 27, 2007 11:05:13 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 1/27/07, Mike Frysinger <vapier@gentoo.org> wrote:
> > after upgrading from 2.17.50.0.9 to 2.17.50.0.10 (.11 too), ld seems unable to
> > do anything remotely basic ... is there something basic i'm missing here ?  i
> > verified that it isnt caused by the Gentoo patchsets as a vanilla build
> > exhibits the issue as well
> 
> 1. Build the last known working binutils, run the testsuite.
> 2. Build the new binutils and configure configure logs looking for
> failing configure tests or changes in the configured options.
> 3. Run the new binutils testsuite and compre the results to the old testsuite.
> 4. Post the results.

I just built the current CVS version of binutils with
gcc version 4.1.2 20061028 (prerelease) (Debian 4.1.1-19).
There are no unexpected fails.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
