Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA30639
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 04:48:00 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Aug 2000 10:47:52 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA06325;
	Wed, 23 Aug 2000 20:47:02 +1000
Date: Wed, 23 Aug 2000 20:46:59 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Tor Arntsen <tor@spacetec.no>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <200008231031.MAA01982@pallas.spacetec.no>
Message-ID: <Pine.LNX.4.21.0008232041400.11816-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 23 Aug 2000, Tor Arntsen wrote:

> The problem with older CVS versions was that it used to say just
> --- ChangeLog on all the levels.  Patch could handle that, using
> the Index line, however only for unique file names.  So people would
> use scripts that fixed the ---/+++ lines before they applied the patch.

Ah Ha!  So an update of puffin cvs would be a good idea.  Provided said
update didn't trash all the old repositories...

-- 
Linuxcare.  Support for the Revolution.
