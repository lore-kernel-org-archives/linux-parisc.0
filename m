From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Fri, 6 Jul 2007 09:20:38 -0700
Message-ID: <5b2e36650707060920w19b07eeeu1fb2cd8f8c38a996__44531.0251242065$1416624404$gmane$org@mail.gmail.com>
References: <20070604014313.GB2075@fattire.cabal.ca>
	<200706040147.l541lAP3022868@hiauly1.hia.nrc.ca>
	<20070629072912.GC9495@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070629072912.GC9495@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 29/06/07, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, Jun 03, 2007 at 09:47:10PM -0400, John David Anglin wrote:
> > > I don't suppose you could strace in a chroot with a older working glibc
> > > and see what syscalls are there?
> >
> > Probably, I won't have time until next weekend.
> >
>
> Could you try this patch?

I tried it to see if it would fix the strangeness in the glibc
testsuite where three tests can't find files, but if run a couple
seconds later finds them fine.  It doesn't fix this, but it also
doesn't cause any further regressions.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
