Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33325482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Mar 2001 06:08:22 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA13203;
	Wed, 28 Mar 2001 23:08:13 +1000
Date: Wed, 28 Mar 2001 23:08:13 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Wragg <dpw@doc.ic.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problem building glibc from cvs
In-Reply-To: <y7rk85a9iqb.fsf@sytry.doc.ic.ac.uk>
Message-ID: <Pine.LNX.4.21.0103282255590.10691-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 28 Mar 2001, David Wragg wrote:

> But the glibc build failed with this
> error from gcc:
> 
> ../sysdeps/unix/sysv/linux/hppa/sysdep.c:35: Internal compiler error in make_dec
> l_rtl, at varasm.c:597
> Please submit a full bug report, with preprocessed source if appropriate.
> See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

I've been making some changes to gcc in the last few days as part of
preparing to merge upstream.  The changes ought to have been innocuous,
but it's entirely possible I've made a blue somewhere.  I'll see if I can
duplicate your problem.  More news in an hour or so.  Or possibly 8 hours
if I give up for the time being and go to bed :-)

Alan
