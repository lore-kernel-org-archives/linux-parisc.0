Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from acad.udallas.edu (unknown [192.91.253.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3ED34868
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 10:35:54 -0600 (MDT)
Date: Fri, 10 Oct 2003 11:35:32 -0500
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; delsp=yes; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
From: Walker White <wmwhite@udallas.edu>
In-Reply-To: <0B279720-FB02-11D7-BD3F-0030656F07A2@esiee.fr>
Message-Id: <C4749327-FB3F-11D7-B35B-0030657CC792@udallas.edu>
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

On Friday, October 10, 2003, at 04:13 AM, Thibaut VAR=C8NE wrote:

> Looks like you've been rather unlucky with your search :-P
> <snip>

Read all those and others.  Other e-mails in that thread referenced =20
seemed to imply that this change had been incorporated into all install =20=

images (as there are no PDC suffixes any more).  So I (incorrectly) =20
assumed that the latest Debian images had this fix.  Debian 3.0 is =20
newer than the 2001 thread that first found this console issue (the =20
2002 thread referenced does not mention the console issue explicitly).

I was wrong; this problem was fixed when I got the PARISC images =20
instead.  But this really should be a line item in the FAQ...

However, now I have another issue caused(?) by the netinstall CD.  =20
Whenever I try to install via ftp or http I get an "cannot download" =20
error on files midway through the base installation process.  For the =20=

longest time it was apt_0.5.4_.  I tried every mirror in reasonable =20
proximity.  No luck.

Finally, I switched to CD install and used the Debian CD (the one that =20=

will not boot to the console).  This works, but then it hangs on =20
bsd_utils.  For hours.  I eventually gave up and rebooted.  And I =20
cannot seem to download this file either.

Anyone have any idea what is going on here?

-Walker

------------------------------------------------------------------------=20=

-----------------------
| Walker White                                                          =20=

  Assistant Professor  |
| wmwhite@udallas.edu                                                   =20=

Dept. of Mathematics  |
| 972 -721-5380                                                         =20=

University of Dallas  |
------------------------------------------------------------------------=20=

-----------------------
