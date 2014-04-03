From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 3 Apr 2014 16:12:03 -0400
Message-ID: <BLU0-SMTP173C739CD0C1E1CE4E403D976C0@phx.gbl>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>	<BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>	<201312191619.05005.vapier@gentoo.org>	<5313A12E.7010307@gmx.de>	<20140401182627.GA3285@drone.musicnaut.iki.fi>	<533B0A57.2060700@gmx.de> <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com> <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl> <533DB961.9010607@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>,
	Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <533DB961.9010607@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4/3/2014 3:41 PM, Helge Deller wrote:
> And the attached patch for kernel isn't necessary, but makes it clear that the colouring is important.
Regarding the kernel patch, I see you have used the British/Canadian 
spelling
of "colour" :-)

I thinking changing SHMLBA does affect things in other parts of the kernel.
That's why I was uncertain whether it would work.

Dave

-- 
John David Anglin    dave.anglin@bell.net

