Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla3.xs4all.nl (smtpzilla3.xs4all.nl [194.109.127.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id B89C4482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 13:15:38 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla3.xs4all.nl (8.12.0/8.12.0) with ESMTP id fAJKFWn7044216
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 21:15:36 +0100 (CET)
Date: Mon, 19 Nov 2001 21:13:49 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] State of official Linux kernel
Message-ID: <20011119211349.A19479@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <Pine.OSF.4.41.0111191911120.11606-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.41.0111191911120.11606-100000@student.cs.ucc.ie>
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

On Mon, Nov 19, 2001 at 07:40:28PM +0000, Markus Grabert wrote:
> Hi,
> 
> I'm just curious what the state of the PA-RISC support of the
> official linux kernel is (2.4.14 from kernel.org).
> 
> IMHO I assume that the latest Linux/PA-RISC progress didn't and won't
> make it in the official linux kernel tree (at least not soon), am I right ?
> (I don't see any hppa changes in the kernel-Changelogs at all)

Not while there are multiple changes per day - anyone with a parisc
machine tracks the parisc-kernel anyway, so what would be the point?

> 
> Probably due to the fact that Linux/PA-RISC is still somewhat
> experimental and probably some design issues are not fixed yet.
> Are there any plans to integrate the lastest stuff into the
> linux main tree (soon) ?

I gather there's more use in fixing bugs than merging. Also see above.

> 
> What about gcc, gdb, glibc and binutils ? How long do you think does it
> take to get the current fixes/patches into a release ?

There's some tough bugs at the moment, and I hope that after those are
squashed our hard-working developers will have the time to concentrate
on the kernel, with a relatively stable parisc development userland.

> 
> AFAIK RedHat/Cygnus supports/maintains gcc, gdb, glibc and binutils.
> Are there (usually) any problems to get the patches/fixes (of gcc, gdb,
> ...) into a official release ? How good is the cooperation with the main
> developers of these tools/libraries ? RedHat doesn't seem to be interested
> in an Linux/PA-RISC port and debian is something like a competitor ...
> 
You can't be serious. Debian/parisc is no competitior of RedHat. I
assume there would be no problem getting fixes in if they are the right
fixes. At this moment, I haven't seen a clear email saying: 'all bugs in
the development tools have been found, go forth and apt-get update!'.

Good luck,
Jurriaan
-- 
IBM: I'm Beyond Mistakes
GNU/Linux 2.4.15-pre6 on Debian/Alpha 64-bits 988 bogomips load:0.15 0.53 0.61
