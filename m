Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA21281
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 03:32:02 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 10:35:01 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A8120B005; Wed, 20 Dec 2000 10:28:53 +0000 (GMT)
Date: Wed, 20 Dec 2000 10:28:53 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alex deVries <adevries@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hwclock
Message-ID: <20001220102853.F2554@linuxcare.com>
References: <3A3F8376.BF84A667@linuxcare.com> <200012192325.PAA16134@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012192325.PAA16134@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Dec 19, 2000 at 03:25:34PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 19, 2000 at 03:25:34PM -0800, Grant Grundler wrote:
> Alex deVries wrote:
> > There's been some discussion on IRC about not always having to set the
> > clock when in userspace.  I had a quick look at it, and it shouldn't be
> > too hard.  We just need a parisc version of hwclock which calls the
> > PDC_TOD functions.
> 
> CONFIG_GENRTC in fact does use PDC_TOD.
> Randolph Chung had hwclock working for PXC-L/L2 machines and I tested it
> on my c3k (32-bit) a few weeks back.
> If it's broken, then it's a "recent" change.

Works for me on B180L (once I created /dev/rtc).  Kernel source as of
CVS 12 hours ago.

Richard
