From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: systemd on hppa and number of free RT signals
Date: Wed, 8 Oct 2014 01:34:18 +0300
Message-ID: <20141007223418.GB599@drone.musicnaut.iki.fi>
References: <5434418F.1020407@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5434418F.1020407@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Tue, Oct 07, 2014 at 09:39:59PM +0200, Helge Deller wrote:
> Since systemd gets more and more important (e.g. KDE now seems
> to require systemd) we should try to find a solution.

Personally I don't mind such changes (I compile everything from scratch
so ABI breakages are not a big issue), but generally I think Linux/PA-RISC
community could maybe put more focus on some core issues like GCC
and GLIBC support...

A.
