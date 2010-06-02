From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Wed, 2 Jun 2010 13:16:01 -0400
Message-ID: <20100602171600.GA5566@hiauly1.hia.nrc.ca>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <201006021833.23216.modestas@vainius.eu>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: Modestas Vainius <modestas@vainius.eu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201006021833.23216.modestas@vainius.eu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 02 Jun 2010, Modestas Vainius wrote:

> Hello,
> 
> this bug [1] is back to the "very common" department with eglibc 2.11 (libc6-
> dev_2.11.1-1) builds. Majority of KDE applications are failing to build on 
> hppa again. Is there really nothing what could be done to fix it?

I will just say it is very tricky.  I think a fix is possible (arm and mips
had similar cache problems) but the victim replacement present in PA8800/PA8900
caches makes the problem especially difficult  for hardware using these
processors.

I have spent the last few months testing various alternatives and have
now done hundreds of kernel builds.  I did post some experimental patches
that fix the problem on UP kernels.  However, the problem is not resolved
for SMP kernels.

The minifail test is a good one to demonstrate the problem.  Indeed,
a very similar test was given in the thread below:
http://readlist.com/lists/vger.kernel.org/linux-kernel/54/270861.html

This thread also discusses the PA8800 problem:
http://readlist.com/lists/vger.kernel.org/linux-kernel/54/271417.html

I currently surmise that we have a problem with the cache victim
replacement, although the cause isn't clear.  I did find recently
that the cache prefetch in copy_user_page_asm extends to the line
beyond the end of the page, but fixing this doesn't resolve the problem.

I am still experimenting with using equivalent aliasing.  It does
help to flush in ptep_set_wrprotect.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
