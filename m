Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35D3A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 May 2003 10:09:07 -0600 (MDT)
Date: Wed, 7 May 2003 18:09:04 +0200
Message-ID: <3EB772D800000C9F@ocpmta2.freegates.net>
In-Reply-To: <20030507154817.GH27494@lug-owl.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>On Tue, 2003-05-06 19:56:48 +0200, Joel Soete <jsoe0708@tiscali.be>
>wrote in message <3EB7766A000003EE@ocpmta7.freegates.net>:
>> >> +#if defined (__hppa__)
>> >> +	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
>> >> +#else
>> >>  	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
>> >> +#endif
>> >
>> >You don't need to conditionalize the statement with the cast.  It should
>> >work on all ports.
>> >
>> I trust you.
>> 
>> So it will finaly become:
>[...]
>
>With this patch applied (plus the diva patch I've sent to the list these
>days) I can compile'n'boot:

Thanks first for feedback.
I also have a look on your patch and it seems to me relevant.

>
>jbglaw@b132l-1:~$ uname -a
>Linux b132l-1 2.4.20-pa33 #15 Wed May 7 08:29:13 CEST 2003 parisc unknown
>unknown GNU/Linux
>
>So I think it would be nice to put this patch into CVS.
>
I hope also it will be ci but I could not help.

Thanks again,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
