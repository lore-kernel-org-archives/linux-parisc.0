Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57DA8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 03:23:46 -0700 (MST)
Message-ID: <3C3EBD2F.3040905@esiee.fr>
Date: Fri, 11 Jan 2002 11:23:43 +0100
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Nicholas Leippe <nick@byu.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] video capabilities?
References: <02011019595101.17281@nick>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

>
>
>Also, for some reason I can't get any sound out of
>it.  I can get garbled clicks out of the speaker,
>but mpg123 doesn't play recognizably and artsd
>fails to start with an error.
>

I bet you used the 0.9.3, which is good.
Unfortunaly, the Harmony (audio chipset) bug
has only been corrected after. 2 solution:
1) Download the kernel sources from a CVS snapshot:
    ftp://ftp.parisc-linux.org/cvs
    and compile a new kernel.
2) Ask me to put a kernel in a download place. But please
   remember this will not be an official kernel.

Regards,
Matthieu

>
>
>Nick
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
