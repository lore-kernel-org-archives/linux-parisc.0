Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from acad.udallas.edu (acad.udallas.edu [192.91.253.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 469DA484E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 13:47:50 -0600 (MDT)
Date: Fri, 10 Oct 2003 14:47:41 -0500
Subject: Re: [parisc-linux] IBM 3151 on K200 in Debian 3.0
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
From: Walker White <wmwhite@udallas.edu>
In-Reply-To: <8850B2D4-FB4E-11D7-BD3F-0030656F07A2@esiee.fr>
Message-Id: <9C146012-FB5A-11D7-B35B-0030657CC792@udallas.edu>
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

Okay.  Almost done here.  That swap trick DID work.  It just did not  
read the K200 manual to see that HP boots from the end of the SCSI  
chain and not the beginning.  So everything is loaded and it boots.

However my boot crashes right after loading cron.  This is possibly a  
result of the fact that some of my packages came from the debian CD and  
not the netinstall.  Here is the error:

***
Starting periodic command scheduler: cron
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
/bin/sh: /dev/ttyB0: No such device
INIT: Id "T0" respawning to fast: disabled for 5 minutes
INIT: no more processes left in this runlevel

The machine then sleeps for 5 minutes and repeats the error on wake-up  
(so I never get a login).

Using the installation CD, I have opened a shell to verify that there  
is indeed a /dev/ttyB0.  Is this error because I got packages from a  
source other than the netinst CD or is there something else going on  
here?

-Walker

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
