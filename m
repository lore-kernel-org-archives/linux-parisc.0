Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 303E04834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 10:23:37 -0600 (MDT)
Message-Id: <200210241623.g9OGNS9n025493@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
To: jsoe0708@tiscali.be
Date: Thu, 24 Oct 2002 12:23:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: mszick@goquest.com, grundler@dsl2.external.hp.com,
	joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DA3C54C00002A9E@ocpmta5.be.tiscali.com> from "jsoe0708@tiscali.be" at Oct 24, 2002 07:44:40 am
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

> >Soon to be in 3.3.  I found a couple of more things yesterday in testing.
> >It needs a lot of testing (hppa1, hppa2, hppa64, hpux, linux, pic, short
> >and long calls).
> >
> Great, (I will wait).

The "final" patch is here

<http://gcc.gnu.org/ml/gcc-patches/2002-10/msg01408.html>

and

the required patch to reload here

<http://gcc.gnu.org/ml/gcc-patches/2002-10/msg01409.html>.

These should apply cleanly to the current 3.3 cvs.

I think the main benefit under hppa-linux is the PA 2.0 fix.  If
you have applications where you need "-ffunction-sections" to build
or there are long call related problems (ie., you get assembler
errors about out of range branches), I would appreciate feedback
on how the new long call option works.  I have tested building gcc
with long calls and that works fine.

Currently, 3.3 is in a bug fix phase.  The only reported bug that
I have regarding long calls  or out of range branches was in proprietary
code.  So, if people know of others, let me know.

There needs to be some work done on the linker to handle long absolute
calls (non-pic code) and long pc-relative calls (pic code).  This will
shorten the long call sequences under hppa-linux, particularly for calls
within modules.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
