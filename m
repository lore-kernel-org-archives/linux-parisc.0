From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Success! was Re: [parisc-linux] Get your Matrox ...
Date: Sat, 5 Jun 2004 10:47:19 +0100
Message-ID: <20040605094719.GA27296@sal.ucc.ie>
References: <20040602221734.GA26176@solo.franken.de>
	<20040603032304.GA22448@sal.ucc.ie>
	<20040603133819.GB1949@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040603133819.GB1949@solo.franken.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 03, 2004 at 03:38:19PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Jun 03, 2004 at 04:23:04AM +0100, M. Grabert wrote:
> >
> > beast kernel: matroxfb: Pixel PLL not locked after 5 secs
> > beast kernel: matroxfb: Loop PLL not locked after 5 secs

I finally was able to put the Matrox in a desktop PC.
It worked without problems! But just to be sure I performed a
graphic card BIOS upgrade (Setup351.exe from Matrox.com).

And then I put it back into my PA machine and ...
... now it works! No more PLL errors!

Now I'm running 1280x1024, 16bit @ 75Hz (32bit also works,
but visibly slower, since it's not accelerated and twice as much
pixel data has to be moved if you move a window. 16bit is fine).
Well, I could run higher resolutions, but I just have a 17" monitor ;)

> bad, either the PLL setup write didn't reach hardware, or
> reading of the locked bit of the PLL fails. It looks like
> the PCI subsystem behaves differently between my B2600 and
> your C3000 :-(
>
> Can anybody describe the difference of the PCI bus between C3000 and
> B2600 ?

I thought there is almost no difference between the B2xxx and C3xxx
series ...

Greetings,
   Max


PS: In case your PA box crashes, the Matrox RAM/config/whatever can
come into a inconsistent state and will refuse to be initialized
properly if you simply reboot (but it will not print out error msgs).
You *must* power cycle the computer (and I believe even disconnect it
physically from the power line for a couple of seconds) in order
to reset the Matrox properly, and be able to use it again.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
