From: John David Anglin <dave.anglin@bell.net>
Subject: Re: systemd on hppa and number of free RT signals
Date: Wed, 8 Oct 2014 11:59:24 -0400
Message-ID: <BLU436-SMTP47EE271F36DCCDA27582B797A30@phx.gbl>
References: <5434418F.1020407@gmx.de> <20141007223418.GB599@drone.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Jeroen Roovers <jer@gentoo.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141007223418.GB599@drone.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/7/2014 6:34 PM, Aaro Koskinen wrote:
> Personally I don't mind such changes (I compile everything from scratch
> so ABI breakages are not a big issue), but generally I think Linux/PA-RISC
> community could maybe put more focus on some core issues like GCC
> and GLIBC support...
I think that's happening.

On Debian unstable, we currently have 10291 installed packages.
We are neck to neck with ppc64, and a couple hundred behind alpha.
http://buildd.debian-ports.org/stats/

At this point, adding new packages requires porting and bug fixes. The 
signal change proposed
by Helge here is an example.

I am working at the moment on an update to the GCC fast indirect call 
support for Linux.  There
are also two trunk breakages and several minor issues ongoing.

Is there something specific you would like to see?

Dave

-- 
John David Anglin    dave.anglin@bell.net

