Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla3.xs4all.nl (smtpzilla3.xs4all.nl [194.109.127.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D760482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 12:06:04 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla3.xs4all.nl (8.12.0/8.12.0) with ESMTP id fA7J5vIw086197
	for <parisc-linux@lists.parisc-linux.org>; Wed, 7 Nov 2001 20:06:01 +0100 (CET)
Date: Wed, 7 Nov 2001 20:05:49 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] More recent ISO's
Message-ID: <20011107200549.A5828@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <3.0.5.32.20011107090504.007f9440@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3.0.5.32.20011107090504.007f9440@mail.magma.ca>
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

On Wed, Nov 07, 2001 at 09:05:04AM -0500, Herb Radford wrote:
> Booting my C200 probably requires a newer kernel. Are there any more recent
> ISO's than the one available for 0.9.2?

not to my knowledge. 0.9.3 was due out just now, but there is trouble
with the toolchains, people have been warned to not 'apt-get update'
etc., so it's been delayed.

> Are there any more detailed instructions than those for PALO?

I think that most of your questions will be answered if you look in the
archives for this list - the first install is something all of us have
gone through. If it's not there, and not in the docs, feel free to ask!

> I have a burner, but I have not yet set up a compile environment so I'm not
> sure I can get there easily.

I installed my C200 without a parisc-compile environment - you don't
need one. Just make sure your serial terminal is operational and you
have the right cable.

> 
> Not that it has to be easy, I've been compiling x86 kernels to suite my
> ever-changing systems since kernel 0.9. I'm just having a bit of a problem
> with Debian's apt and stuff.
> 
There have been some 'ultra-short' apt 'get started' instructions posted
to this list also. Again, browsing the archives is worth your while.

Good luck,
Jurriaan
-- 
Firstly, when confronted with the twisted strangeness of variable numbers of
arguments, the problem returns... and he who has not kept his faith strong by
repeated practice shall surely fall to this subtle trap.
	Henry Spencer - The Ten Commandments for C programmers (Annotated Ed.)
GNU/Linux 2.4.13-ac7 on Debian/Alpha 64-bits 988 bogomips load:0.00 0.28 0.82
