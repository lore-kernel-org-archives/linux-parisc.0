From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hanging linuxthread processes
Date: Sat, 21 Apr 2007 12:00:51 -0400 (EDT)
Message-ID: <200704211600.l3LG0pp1025406__7577.06367080591$1416624337$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440704210751o66fae91mc10f30f429c71143@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <119aab440704210751o66fae91mc10f30f429c71143@mail.gmail.com> from "Carlos O'Donell" at Apr 21, 2007 10:51:06 am
List-ID: <linux-parisc.vger.kernel.org>

> On 4/21/07, Helge Deller <deller@gmx.de> wrote:
> > Do we still see pthread/linuxthread-"hangs" on HPPA ?
> 
> The HPPA hangs are attributed to a race condition in our space id
> setting code. We can reproduce this at will, but we don't yet have a
> good solution. See the older thread about this.

With James' last patch for this problem, I haven't had any zombies
in the GCC testsuite for a couple of months.  My c3k running 2.6.20
hasn't crashed in the same period.  Before, it was crashing every
couple of days.  I'd encourage James to queue this patch for the
next merge even if it isn't perfect.

I tried the testcase from the alpha PR and it didn't cause a problem.

I am seeing timeouts in some thread intensive tests.  For some reason,
these are significantly more frequent on pa8800 with a 64-bit kernel.
I haven't had a chance to investigate but we may have a deadlock somewhere.
I did have a software lockup using a UP kernel a couple of weeks ago.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
