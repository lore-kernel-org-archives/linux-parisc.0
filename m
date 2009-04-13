From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] tg3: fix big endian MAC address collection failure
Date: Mon, 13 Apr 2009 20:48:18 +0000
Message-ID: <1239655698.3278.83.camel@mulgrave.int.hansenpartnership.com>
References: <1239636110.3278.29.camel@mulgrave.int.hansenpartnership.com>
	 <20090413180052.GB11076@xw6200.broadcom.net>
	 <1239646516.3278.57.camel@mulgrave.int.hansenpartnership.com>
	 <20090413183725.GC11109@xw6200.broadcom.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: "linux-netdev@vger.kernel.org" <linux-netdev@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Michael Chan <mchan@broadcom.com>
To: Matt Carlson <mcarlson@broadcom.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090413183725.GC11109@xw6200.broadcom.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-04-13 at 11:37 -0700, Matt Carlson wrote:
> But that is exactly what the code is doing.  tg3_nvram_read_be32() will
> return the data in bytestream format.  A memcpy() should be all that is
> needed to transport the data to a different memory location.

But not the one you've done.  cpu_to_be32 is a nop pass through on our
architecture, so tg3_nvram_read_be32 is equivalent to tg3_nvram_read on
our architecture (i.e. identical to the code that was doing the read in
2.6.29).  However, the memcpy is the wrong way around for us.  If you
look at an example, the original code said

dev_addr[0] = hi >> 16;
dev_addr[1] = hi >> 24

So MSB-1 and MSB.  However, on a BE machine these are at offset one and
zero from the start of the word.  The replacement memcopy is:

memcpy(&dev->dev_addr[0], ((char *)&hi) + 2, 2)

i.e. offset 3 and 4, which actually copies LSB-1 and LSB into there.
You can follow similar logic to show that the lo copy is wrong too.

Perhaps the fix is just to put the tg3_nvram_read() back as well as the
original by loads?

James



