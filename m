Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 501AD488A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 20:07:22 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id hAR37Lvq021733
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Nov 2003 03:07:21 GMT
Date: Thu, 27 Nov 2003 03:07:18 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
Message-ID: <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C3000 and 2.6 - need config help
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

On Thu, 20 Nov 2003, M. Grabert wrote:

> Right now I'm using a 120GB IDE using the onboard IDE of the C3k, and
> I get just about 3MB/s with 2.4.22-paX, which might indicate that DMA is
> not supported (I turned DMA/32bit on with hdparm, but no effects). I also
> doubt that the driver for the onboard IDE chipset is much better in the
> 2.6 kernel, so I opted to install a IDE PCI card.

The IDE harddisk is running for the last couple of months, and I had no
errors whatsoever (using the onboard IDE chipset of the C3k).

However it appears that writing and reading from/to the harddisk slows
down the access time quite a bit (ie. streaming a 180kbit/s movie and
writing a file with 1000kbit/s makes the movie to appear/play jerky);
whereas multiple reads doesn't affect it (ie. streaming serveral movies at
a time with 180kbit/s each).

> Unfortunately the only new PCI IDE cards you can get in the shops these
> days that are ones with the Promise or the SiliconImage chipset;
> suppor for the Promise chipset under linux used to be crap, and
> SiliconImage is only suppoted with 2.6, but at least it works, so I went
> for the latter. Therefore I'm eager to get 2.6 running!

Can anybody tell me what config options I need to boot a 2.6 kernel
without serial console support (since it's broken) and without
STI (since I don't have a graphics card in my C3k)?
I've seen a config option 'DUMMY_CONSOLE' in .config, but I don't find
how to select it in 'make menuconfig' or any description in Documentation/.

I have several machines that run headless - I use serial console then.
But I never had a situation where I didn't even have serial console ...


Thanks for any hints,
  Max
