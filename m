Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14176
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 13:57:06 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 4F23433B
	for <parisc-linux@thepuffingroup.com>; Fri,  1 Sep 2000 12:57:12 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id NAA21030
	for <parisc-linux@thepuffingroup.com>; Fri, 1 Sep 2000 13:00:31 -0700 (PDT)
Message-Id: <200009012000.NAA21030@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Branching "stable" 2.3.99pre8 kernel 
In-reply-to: Your message of "01 Sep 2000 15:41:55 PDT."
             <87r973lx18.fsf@linuxcare.com>
Date: Fri, 01 Sep 2000 13:00:29 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines wrote:
...
> Therefore, until it gets fixed, I am using a hacked-up combination of
> the pre-merge 2.3.99pre8 and updated signal and trap handling code.  I
> would like to tag this as a branch in CVS so that I can continue to
> fix kernel bugs that affect me without having to fully update to 2.4.0.
> 
> Will people mind terribly if I do this?  It should be trivial to merge
> changes from the branch as needed.

David,

I don't mind...I just don't want the fixes you make there get lost.
Please either post the fixes to the list or sign-up a maintainer (like
myself) to merge fixes into the 2.4.0-test6 based branch ("mainline").
I'd be happy to merge the few parts I understand/have clue about for you.

thanks,
grant
