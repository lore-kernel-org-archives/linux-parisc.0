Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA28873
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 03:50:01 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Aug 2000 09:49:52 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA05606;
	Wed, 23 Aug 2000 19:49:10 +1000
Date: Wed, 23 Aug 2000 19:49:10 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Tor Arntsen <tor@spacetec.no>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <200008230849.KAA01294@pallas.spacetec.no>
Message-ID: <Pine.LNX.4.21.0008231946220.11816-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 23 Aug 2000, Tor Arntsen wrote:

> Which versions of CVS are you using?  CVS used to output diffs without
> including the directory path in the --- and +++ lines, but that's been
> fixed long ago.  I don't have any problems with patch anymore.

You will if the diff contains files that exist in the root dir of your
source tree and in subdirs, eg. Makefile.in and bfd/Makefile.in

-- 
Linuxcare.  Support for the Revolution.
