Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from noose.gt.owl.de (noose.gt.owl.de [62.52.19.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76D2A482C
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 00:32:13 -0700 (MST)
Date: Wed, 12 Dec 2001 08:14:41 +0100
From: Richard Higson <richard.higson@gt.owl.de>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 0.9.3-rc6 -> final, apt, and rsync
Message-ID: <20011212081441.A18644@glurp.gt.owl.de>
References: <20011212062632.44A9037E86@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011212062632.44A9037E86@carmen.fc.hp.com>
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

On Tue, Dec 11, 2001 at 11:26:32PM -0700, Matt Taggart wrote:
> To: parisc-linux@parisc-linux.org
> From: Matt Taggart <taggart@carmen.fc.hp.com>
> Subject: [parisc-linux] 0.9.3-rc6 -> final, apt, and rsync
> Date: Tue, 11 Dec 2001 23:26:32 -0700
> 
> Hi palinuxers,
> 
> Hopefully you've seen the 0.9.3 announcement.
> 
> After much testing the 0.9.3 release candidate 6 was declared the final
> 0.9.3. So if you grabbed either of the -rc6 isos you already have the
> right thing. The 0.9.3 isos are based on woody. If you have installed a
> previous release and have a decent net connection there's no need to
> reinstall, you can seamlessly upgrade using apt-get.
CONFIRM: Yesterday evening I just did 
`apt-get update && apt-get upgrade && apt-get moo`
which took a while, but mostly just worked ;-)

I also ran dselect through `update, select, install, configure, remove` menus
to make sure that apt-* and dpkg-* are in sync.
(This might be habit -  I've been doing it since Bo/Rexx and it just seems to work ;-)

It seemed to clean up any rough edges that might have been accumulated over the
months ;-)

This was on a
cpu family      : PA-RISC 1.1d
cpu             : PA7100LC (PCX-L)
cpu MHz         : 100.000000
model           : 9000/715
model name      : Mirage 100


Next move is to see if I can compile & boot from kernel-source-2.4.16-hppa.tar.bz2
natively.

Outstanding work, people; Thank You all.

Richard - 
-- 
Unix:        Your gun, Your bullet, Your foot, Your choice.
M$-CE/ME/NT: Same as Unix, BUT: No choice, and We Aim Higher.
Have a nice day ;-) Richard Higson mailto:richard.higson@gt.owl.de
