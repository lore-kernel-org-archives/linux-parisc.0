Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16975
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 20:16:58 -0600
Message-ID: <19990501022458.64384@insula.local>
Date: Sat, 1 May 1999 02:24:58 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Alex deVries <adevries@redhat.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker problems
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com>; from Alex deVries on Fri, Apr 30, 1999 at 07:07:56PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> That's remarkably gross, since it indicates that there's a problem with
> the linker.  I'm not quite sure what it is, but the problem seems to come

I think I have fixed it in CVS. Please all retry 8)

> I think that's a good thing for someone to look into.

Still, someone could look into whether what I have done was right, so the
comments in the code seem to imply very strongly to me it is.

binutils/ld/emultempl/hppaelf.em is now version 1.2, was version 1.1.

	Philipp
