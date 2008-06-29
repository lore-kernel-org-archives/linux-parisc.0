From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 15:05:27 -0600
Message-ID: <20080629210527.GB8381@colo.lackof.org>
References: <20080629151759.GA7856@spring.luon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Sjoerd Simons <sjoerd@luon.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629151759.GA7856@spring.luon.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 29, 2008 at 04:17:59PM +0100, Sjoerd Simons wrote:
> Hi,
> 
>   Kernel 2.6.24 causes the machine to fault when a dual-link network card is
>   installed right after loading the tulip module. Output of SER PIM attached.

BTW, once you've captured a PIM, it needs to be cleared with "ser clearpim"
before it will record the next one.

And thanks - this confirmed what several had suspected:

Timestamp =   Sun Jun  29 14:45:18 GMT 2008    (20:08:06:29:14:45:18)

Bus      HPA       Module Type      Path  Slt Md Sev Estat Requestor Responder
----- ---------- ---------------- -------- -- -- --- ---- ---------- ----------
GSC   0x0000006d A DMA I/O        8/8       2  0 fe  0x03 0x00000000 0x00000000

Type "io info" will dump all the IO devices and you can match the "8/8"
path to the offending device. I suspect it's the card-mode Dino as well.

We probably need to enable "PCI_DEBUG" which depends on "DEBUG_KERNEL".
Enable both of those, then capture the console output when booting
that kernel. We can then walk through the Dino and PCI code to see
what didn't get setup correctly.

thanks,
grant
