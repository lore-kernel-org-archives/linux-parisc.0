From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: NPTL fixes.
Date: Sat, 22 Jul 2006 11:54:23 -0700
Message-ID: <20060722185423.GA30156@titanium.v3.ca>
References: <119aab440607181547v383ed926ic3420c7865846361@mail.gmail.com>
	<20060720221634.GA25514@titanium.v3.ca>
	<119aab440607210834u7761a7e2w54e3990fedaa995c@mail.gmail.com>
	<20060721155009.GA18291@titanium.v3.ca>
	<119aab440607221000w6cf467c2k8d16edf20e7791c4@mail.gmail.com>
	<119aab440607221000w687c2d8v9afa5fb7d7bdd12b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607221000w687c2d8v9afa5fb7d7bdd12b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

(restoring cc:'s dropped by accident)

On Sat, Jul 22, 2006 at 01:00:58PM -0400, Carlos O'Donell wrote:
> On 7/22/06, Carlos O'Donell <carlos@systemhalted.org> wrote:
> >> If yes, I'll make it a priority next week so that I can get some initial
> >> bootstrapping stuff done.
> >
> >It's not high-prio, I don't care about the ABI break, I care primarily
> >about reducing the number of failures. After the failures are reduced
> >we *might* be able to tackle ABI compatibility... but again I doubt
> >this, since it would require similar patches to Linuxthreads which
> >were rejected before and will be rejected again. Not to mention it
> >causes weird headaches with all the other arches that put
> >uninitialized locks in .bss.
> 
> Is an alternative that we bump the .so number in the thread library?

Yes an no.  That solves the problem from an upstream perspective, but it
will make upgrading to NPTL for current parisc users hard.  The problem
is that we don't version libpthreads itself, we only version libc6.  The
packaging system doesn't then provide any hints that the version of
libpthreads that the packages are looking for doesn't exist anymore.

If you're going to bump the version number of pthreads, I'd recommend
taking this time to do a break on glibc as well and get any changes done
that you might need to.

Tks,
Jeff Bailey

-- 
I do not agree with a word you say, but I will defend to the death your
right to say it. 
 - Voltaire
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
