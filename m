Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA15594
	for <parisc-linux@sod.res.cmu.edu>; Mon, 19 Apr 1999 17:17:09 -0400
Message-Id: <199904192116.OAA06503@cllmail.cup.hp.com>
Subject: Re: [parisc-linux] kernel updates.
Date: Mon, 19 Apr 1999 14:17:19 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Ulrich Drepper" <drepper@cygnus.com>
cc: "Alex deVries" <adevries@redhat.com>, <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>But this is a problem.  We might have to change the names then.  One
>of the essential things about ELF is that it must be possible to have
>support for all kind of architectures in one program.  So all the
>definitions have to be able to peacefully coexist in one header file.

I don't believe there are any cases where the same name conflicts with 
two different numbers. We have cases where two names are used to refer to 
what is essentially the same relocation type, but that shouldn't be a 
conflict.

-cary
