Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from acad.udallas.edu (acad.udallas.edu [192.91.253.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id F30C349CC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 12:31:39 -0600 (MDT)
Date: Fri, 10 Oct 2003 13:31:33 -0500
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
From: Walker White <wmwhite@udallas.edu>
In-Reply-To: <8850B2D4-FB4E-11D7-BD3F-0030656F07A2@esiee.fr>
Message-Id: <F91FD8D9-FB4F-11D7-B35B-0030657CC792@udallas.edu>
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

256 MB of RAM (4 64 MB chips).  With 4 2GB SCSI drives.

I managed to get it to work by doing the following:

a) Do network install until reaching a download error.
b) Swap to the Debian CD.
c) Load from Debian CD until a perceptible hang.
d) Reboot machine and remount all drives.
e) Goto (a) and repeat until base install finished.

That seemed to work (just finised a few minutes ago), but now the  
machine does not boot on restart.  I am currently trying to fish the  
kernel off the netinstall CDs (I cannot find vmlinux32 anywhere) --  
just in case the installed kernel is bad.


> How much RAM does your box have?
> I have already seen that kind of trouble with boxes shipped with less  
> than 64MB RAM...
>
> It's also possible that these 2.4.22 ISOs are somehow corrupted, but  
> considering the ratio of downloads vs complaints, it seems quite  
> unlikely (or so I hope).
> Obviously we can't test all these ISOs as we're building them...
>
>
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>
>
------------------------------------------------------------------------ 
-----------------------
| Walker White                                                           
  Assistant Professor  |
| wmwhite@udallas.edu                                                    
Dept. of Mathematics  |
| 972 -721-5380                                                          
University of Dallas  |
------------------------------------------------------------------------ 
-----------------------
