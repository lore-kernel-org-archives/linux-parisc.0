Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA23299
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 02:14:51 -0600
Received: from user48-177.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.177)
  by mailserv2.iuinc.com with SMTP; 30 Aug 2000 08:14:55 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CDEDBB005; Wed, 30 Aug 2000 09:15:04 +0100 (BST)
Date: Wed, 30 Aug 2000 09:15:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000830091504.C877@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com> <20000829172308.A1032@vodka.thepuffingroup.com> <20000830011752.A9854@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000830011752.A9854@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Wed, Aug 30, 2000 at 01:17:52AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 30, 2000 at 01:17:52AM +0100, Matthew Wilcox wrote:
> Anyway, would either of Richard or Helge like to look over the lasi_82596
> driver and convert it to use the flush_kernel_dcache_range() interface
> or tell me why my code is no good and I suck?  Ditto the sim700 driver
> actually.  Are there any other drivers which have simply taken the
> lasi_82596 wback code and replicated it or are these the only two?

Only those two, so far as I'm aware.  I'll have a look at them.

Richard
