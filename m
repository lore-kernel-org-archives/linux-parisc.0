From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped
 address
Date: Fri, 4 Apr 2014 17:45:04 +0200
Message-ID: <20140404174504.1ed30281@marga.jer-c2.orkz.net>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
	<BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>
	<201312191619.05005.vapier@gentoo.org>
	<5313A12E.7010307@gmx.de>
	<20140401182627.GA3285@drone.musicnaut.iki.fi>
	<533B0A57.2060700@gmx.de>
	<CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com>
	<533C7C9A.5080703@gmx.de>
	<BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>
	<533DB961.9010607@gmx.de>
	<BLU0-SMTP173C739CD0C1E1CE4E403D976C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP173C739CD0C1E1CE4E403D976C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 3 Apr 2014 16:12:03 -0400
John David Anglin <dave.anglin@bell.net> wrote:

> On 4/3/2014 3:41 PM, Helge Deller wrote:
> Regarding the kernel patch, I see you have used the British/Canadian 
> spelling of "colour" :-)

Also:

+#define SHM_COLOUR 0x00400000	/* shared mappings coulouring */

coulouring => colouring


     jer
