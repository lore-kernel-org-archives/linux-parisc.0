Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2833482D
	for <parisc-linux@parisc-linux.org>; Fri, 20 Jun 2003 05:52:38 -0600 (MDT)
Date: Fri, 20 Jun 2003 13:43:05 +0200
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: Laurent CANET <canetl@esiee.fr>,
	Thierry SIMONNET <simonnet@esiee.fr>
To: parisc-linux@parisc-linux.org
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
Message-Id: <5B78941A-A314-11D7-A94E-0030656F07A2@esiee.fr>
Subject: [parisc-linux] KGDB Port first patch release
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

Hi fellow pa-ckers!

As some of you may know, Laurent Canet and myself were working on 
porting KGDB to the parisc architecture.

Well, the good news is that we did it!
The bad new is that it doesn't work for every possible configuration ;)

As you can see on the webpage http://pateam.esiee.fr/kgdb.html we 
currently only support 32bit capable GSC boxes featuring Lasi/Dino 
serial port (which is quite a lot of machines already ;)

TBH, we have currently only tested it on B132 using various kernel 
configuration.

It's worth mentioning SMP isn't supported atm (some locks to be fixed) 
as well as step-by-step execution (we are working on it too). It's 
sorta a "beta" version of the patch, but it works pretty well as far as 
we could check.

We lack material to test our stuff, so any feedback would be greatly 
appreciated!

Next steps planned are:
- fix SMP
- fix step-by-step
- make it work on SuperIO boxes
- port to 2.5

The patch also adds a "Compile kernel with frame pointer option" and 
takes care of removing lifimage (created by "make palo") on "make 
clean".
Maybe we want one or both changes to be committed upstream, any thought 
?

HTH,


Thibaut VARENE
Laurent Canet
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
