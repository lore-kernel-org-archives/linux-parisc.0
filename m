Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postman (postman.fament.com [208.189.26.50])
	by dsl2.external.hp.com (Postfix) with SMTP id A36BC482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Jul 2001 07:56:02 -0600 (MDT)
Received: from  postman.fament.com (208.189.26.50) by POSTMAN (MailMax 4. 7. 0. 0) with ESMTP id 33430904 for parisc-linux@lists.parisc-linux.org; Tue, 10 Jul 2001 08:55:43 -0500 CDT
From: awyatt@intergate.cx
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti console problem
Date: Tue, 10 Jul 2001 08:55:42 -0500
Message-Id: <20010710135602.A36BC482B@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Is the Fast Wide controller on the 735 supported yet? I attempted to 
install .9 and it seemed to find a controller, and error out then it 
did not find any of my drives .. (I did have a CDROM and a 1GB drive 
on the narrow controller, but I have 10GB that I'd like to use also 
heh)

Andrew

> Original Message from Tue, 10 Jul 2001 14:37:49  0100:> 
> On Mon, Jul 09, 2001 at 04:09:02PM  0200, Matthieu Le Corre wrote:
> > i got a 735 appollo series ,with 0.9 iso installed 
> > i've installed sti kernel all work execpt that i get an 'unable 
to open 
> > initial console " all right seems to be good
> > don't undestand why it failed ,
> > need help !!!
> 
> From  it appears that STI console
> has not been tested on 735.  Can you try a serial console install?
> 
> When you say "all work" do you mean the installer ran and let you
> install the system?  At which point did you get "unable to open
> initial console"?  During the initial boot from CD, during the
> reboot in to the second stage install, or after that, when booting
> in to the installed system?
> 
> 
> Richard
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
> 
> 

_______________________________________________________________________________
This E-Mail was sent with MailMax/WEB.
http://www.smartmax.com
