Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07778
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 18:18:46 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 20 Aug 2000 00:18:34 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 20 Aug 2000 00:18:04 -0000
Date: Sat, 19 Aug 2000 19:13:35 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Grant Grundler <grundler@cup.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000819191335.E32273@vodka.thepuffingroup.com>
References: <20000818124944.A13870@linuxcare.com> <200008182207.PAA07370@milano.cup.hp.com> <20000818220456.A32273@vodka.thepuffingroup.com> <20000819162418.E13870@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000819162418.E13870@linuxcare.com>; from Richard Hirst on Sat, Aug 19, 2000 at 04:24:18PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Aug 19, 2000 at 04:24:18PM +0100, Richard Hirst wrote:
> Dream on ;-)  I've fixed drivers/char/serial.c to allocate our serial ports
> from ttyS00 rather than from ttyS04, and my A180 now boots to a sash
> prompt.  That got rid of the 'pci bus 0 not registered" message also.

OK, can we now lay down the LINUS_240_TEST6_DEVEL tag to indicate that
we're done with merging and development can begin again?  (If you agree,
you (== Richard) can lay it down rather than waiting for me).

-- 
Revolutions do not require corporate support.
