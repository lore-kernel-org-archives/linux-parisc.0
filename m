Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id D27D34857
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 11:41:45 -0600 (MDT)
To: Thomas Marteau <marteaut@esiee.fr>
Subject: Re: [parisc-linux] sti broken in pa32 on B180
Message-ID: <1002303697.3bbdf0d129142@webmail.tiscalinet.be>
Date: Fri, 05 Oct 2001 19:41:37 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be> <20011004071350.A27483@beavis.ybsoft.com> <1002215177.3bbc9709265c5@webmail.tiscalinet.be> <1002262769.3bbd50f1a5860@webmail.tiscalinet.be> <3BBD912C.9DA840E2@esiee.fr>
In-Reply-To: <3BBD912C.9DA840E2@esiee.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Thomas,

Sorry if I could not help you for such a so detailed question.

But I just recompile pa39 (with patch inventory.c) and it seems to solved on tmy 
b180. (also on 712)

Kind regards,
        joel


Quoting Thomas Marteau <marteaut@esiee.fr>:

> Hi Joel,
> 
> First of all, the STI console and fb is dead on my B132. And now, let's
> go to the kbd.
> 
> 	If you tried the disconnect/reconnect trial of strength on your PC,
> you should see with showkey --scancode a scancode 0xAA that tells the
> controller that a kbd has been reconnected.
> On my B132, I don't see that all the time :( and when this occurs, it
> is
> when the kbd do an timeout/parity error.
> And this is a big trouble b/c it seems that we should look at the state
> of the controller all the time and it is not a solution.
> It seems to be integrated in the chip on PCs and on HP boxes, it is not
> designed for that case, it seems.
> 
> I have two things to say but I need an Hardware HP guy to answer those:
> 	-1) Page 69 of LASI_ers.ps, note 2 is mentionned but I can see only
> the
> note 1. Why?
> 	-2) On my B132, in boot_admin, when you press Escape Key too much
> (more
> than 2 times), you can't type anything!
> you need to press enter and then you can type. This is reproductible!
> Is
> it a normal behaviour?
> 
> > Nervertheless on this b180 the (ps/2) kbd problem is reproductible:
> > disconnect, reconnect the kdb then touch any key then:
> > "keyboard: unrecognised scancode (7f) - Ignored"
> > and I do not find a way to reinit the this kdb.
> > (System still running, just loss the access to the console)
> > 
> > Thanks in advance for addtional help,
> >         Joel
> 
> Thanks for any answer or advice, Thomas.
> ESIEE Team
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
