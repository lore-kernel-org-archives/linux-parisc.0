Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA08987
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 19:29:16 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13oyK8-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Thu, 26 Oct 2000 19:28:48 -0600 (MDT)
Message-Id: <m13oyK8-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Helge Deller <deller@gmx.de>
cc: kailasr@webcash.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Make palo problem
In-reply-to: Your message of "Fri, 27 Oct 2000 03:17:37 +0200."
             <00102703173703.00370@P100>
Date: Thu, 26 Oct 2000 19:28:41 -0600
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= > ipl.a: could not read symbols: Archive has no index; run ranlib to add one
= > make[2]: *** [iplelf] Error 1
= > make[2]: Leaving directory `/cvs/palo/ipl'
= > make[1]: *** [makeipl] Error 2
= > make[1]: Leaving directory `/cvs/palo'
= > make: *** [palo] Error 2
= > 
= 
= you need to go to /palo/ipl and do  "hppa-linux-ranlib ipl.a". Then go back 
= to /linux and do a "make palo" again.
= 
= This is a common problem, in which I also run every time if /palo changes. 
= Matt/Paul: can't we fix this in the Makefile ?

I changed ipl/Makefile to use hppa-linux-ar rather than ar.  No
ranlib is required in this case.

Prior to this the native host's ar was being used.  Mine 
(GNU ar 2.9.5) has always
worked without need of an extra ranlib step but I guess that's not
true for everyone.  People using 'ar' which requires a following ranlib
should probably insert a ranlib line into palo/palo/Makefile after
the 'ar' there.  Just how likely is it to find this type of ar on
Linux these days?

	-P
