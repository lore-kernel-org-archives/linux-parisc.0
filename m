Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02516
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 16:05:57 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 30 Oct 2000 23:07:37 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13qO1Y-0002nS-00; Mon, 30 Oct 2000 23:07:28 +0000
Date: Mon, 30 Oct 2000 23:07:28 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Phillip Beal <pdbeal@bealz.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot Problems with 755
Message-ID: <20001030230728.B9539@parcelfarce.linux.theplanet.co.uk>
References: <20001030174030.A23768@Ci271622-a.lusvil1.ky.home.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001030174030.A23768@Ci271622-a.lusvil1.ky.home.com>; from pdbeal@bealz.net on Mon, Oct 30, 2000 at 05:40:31PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 30, 2000 at 05:40:31PM -0500, Phillip Beal wrote:
> IP-Config: No network devices available
> 
> I know this was a problem on some people with a different system, but
> the same fix doesn't work with the 755 since it has no PCI bus.  The
> kernel returns this for the LAN adapter, but I don't know what to
> compile to enable this device:
> 
> Coral II Core LAN (802.3) (10) at 0xf0826000, versions 0xa, 0x0, 0x72,
> 0x0, 0x0
> 
> What do I need to do to be able to use this LAN adapter, if its even
> supported right now.  Alternatively, can the HP 755 machine boot through
> the serial connection or something other than the LAN adapter?

This isn't tagged correctly in the hwdb.  Could someone inside linuxcare
please fix this?  It should be supported by the Apricot driver.

-- 
Revolutions do not require corporate support.
