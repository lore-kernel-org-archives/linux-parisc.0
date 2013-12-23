From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Mon, 23 Dec 2013 22:26:11 +0200
Message-ID: <20131223202611.GA3570@blackmetal.musicnaut.iki.fi>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
 <201312191619.05005.vapier@gentoo.org>
 <BLU0-SMTP458FC9FB0E8F5D98CB7B8897C50@phx.gbl>
 <201312191802.39169.vapier@gentoo.org>
 <52B4C03B.2000805@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mike Frysinger <vapier@gentoo.org>,
	John David Anglin <dave.anglin@bell.net>, carlos@redhat.com,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52B4C03B.2000805@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Fri, Dec 20, 2013 at 11:10:03PM +0100, Helge Deller wrote:
> You could try my current rewrite for the mmap functions which is in my "aio_mmap_fix" branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
> (http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=aio_mmap_fix)
> Pulling this branch on top of Linux head should work.
> But I think it will not solve this problem.

FWIW, I pulled this branch (aaa88432c03b) on top of 3.13-rc5 and the
system won't boot (HP C3700, 32-bit kernel). There's several stack trace
dumps during the boot; if you're interested I might be able to setup a
serial console to capture these.

A.
