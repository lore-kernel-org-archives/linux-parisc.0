Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA27787
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 19:55:02 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 7 Dec 2000 02:57:39 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 7 Dec 2000 02:57:38 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A2EFD24.28EFD921@linuxcare.com>
Date: Wed, 06 Dec 2000 21:59:48 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] WAX research
List-ID: <linux-parisc.vger.kernel.org>


I've spent some time trying to evaluate what it would be like to get WAX
support into Linux, and have nothing new to report.

Why this mail?  Because I actually dug through some code and thought I'd
mail it here so it'd get archived and because maybe someone here has
something to add.

HP hasn't released docs on WAX and I can see why.  WAX hasn't been used
in ages (the latest one is probably the D270, but they are in all 715s),
and finding the docs is probably hard.  

So... alternative information that's a bit hard to find...

1. OpenBSD

There is some mention of WAX in here, but it's ancient.  Maybe I'm not
looking at the latest version, it is stamped with 

/*      $OpenBSD: wax.c,v 1.1 1998/11/23 03:04:10 mickey Exp $  */

The file in question is src/sys/arch/hppa/dev/wax.c.  You can get
download instructions from http://www.openbsd.org/hppa.html .   

That version of wax.c just has some WAX detection code, although we know
how to do that already.

2. Mach4/Lites

You can get this code from
flux.cs.utah.edu/ftp://flux/mach/ALPHA/pa-snapshot2.tar.gz

I had actually thought that these guys had seen WAX code under NDA, but
the docs say that wax is unsupported.  The code for wax in
usr/src/mach4/mach4-parisc/kernel/hpsgc/busconf.c looks like the code
for asp with the variables replaced.  It looks like this is a dead end
too.

Mach4 actually also has some viper and ASP code that might be helpful.

If anyone has any corrections on any of this, or anything else to add,
let me know.  If there's some public info to go on, it'd enable someone
to actually build up WAX support.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
