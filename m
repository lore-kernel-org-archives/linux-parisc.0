Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (ns1.au.network4.net [203.25.143.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A8CF4845
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Jun 2002 08:31:28 -0600 (MDT)
Date: Sat, 29 Jun 2002 22:31:26 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Cc: Chuck <atkinsc@yifan.net>
Subject: Re: [parisc-linux] 735 and FW SCSI
Message-ID: <20020629223123.A24671@neep.com.au>
References: <MDEAIMOKAJDADFOAOOJEKECICAAA.atkinsc@yifan.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <MDEAIMOKAJDADFOAOOJEKECICAAA.atkinsc@yifan.net>; from atkinsc@yifan.net on Fri, Jun 28, 2002 at 05:19:27PM -0500
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

Chuck said:
> I have a 735/125 and I'm trying to install parisc-linux using the 0.9.3 ISO
> but it doesnt detect any of my harddisks.  It seems the kernel doesnt load
> support for the FW SCSI controller which the disks are on.  It loads the
> driver for the other scsi controller but not the FW SCSI controller.  Is
> there any way I can get parisc-linux to recognize my FW SCSI controller for
> the install?
> 
> Chuck

I might be wrong, but I think the 735's "Outfield" fast-wide SCSI
adapter is not supported - at least not in the kernel on the 0.9.3
CDROM (2.4.9).  The 0.9.3 ISO is a bit old by now, it was released six
months ago in Dec 2001.  The CVS kernel is up to version 2.4.18-pa44.  

Can you move your diskss to the supported controller?  That way at least
you'll be able to get an install happening.

Current net-install CDROM images can be downloaded here:

  http://pateam.esiee.fr/download.html

Please read through this mailing list's archives for information on
installing with these images, as well as Q&As about hardware support.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
