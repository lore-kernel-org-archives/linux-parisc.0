Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA30703
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 03:47:48 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 10:49:30 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BDFA6B007; Thu,  2 Nov 2000 10:48:33 +0000 (GMT)
Date: Thu, 2 Nov 2000 10:48:33 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16
Message-ID: <20001102104833.G32715@linuxcare.com>
References: <200011020821.AAA28301@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011020821.AAA28301@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Nov 02, 2000 at 12:21:36AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 12:21:36AM -0800, Grant Grundler wrote:

> I'd also like to connect some more SCSI disks....but any clue
> what the "CACHE TEST FAILED" is about?
....
> sym53c896-6: rev 0x5 on pci bus 49 device 4 function 0 irq 323
> sym53c896-6: ID 7, Fast-40, Parity Checking
> sym53c896-6: on-chip RAM at 0xfffffffffb000000
> CACHE TEST FAILED: reg dstat-sstat2 readback ffffffff.
> CACHE INCORRECTLY CONFIGURED.

I'd guess that the NCR registers are being cached:


static int __init ncr_regtest (struct ncb* np)
{
        register volatile u_int32 data;
        /*
        **      ncr registers may NOT be cached.
        **      write 0xffffffff to a read only register area,
        **      and try to read it back.
        */
        data = 0xffffffff;
        OUTL_OFF(offsetof(struct ncr_reg, nc_dstat), data);
        data = INL_OFF(offsetof(struct ncr_reg, nc_dstat));
#if 1
        if (data == 0xffffffff) {
#else
        if ((data & 0xe2f0fffd) != 0x02000080) {
#endif
                printk ("CACHE TEST FAILED: reg dstat-sstat2 readback %x.\n",
                        (unsigned) data);
                return (0x10);
        };
        return (0);
}


Richard
