Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF646483E
	for <parisc-linux@parisc-linux.org>; Mon,  3 Nov 2003 02:12:02 -0700 (MST)
Date: Mon, 3 Nov 2003 10:11:59 +0100
Message-ID: <3F969FFE00005DB3@ocpmta2.freegates.net>
In-Reply-To: <20031102202228.GA26145@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was: do_page_fault?]
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
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

Carlos,

Yes it didn't crash anymore :)

But I didn't have more opportunity to reboot severall time this c110 to make
more test (the only difference between the two previous one: the first was
a reboot, the second was a boot? and absolutley no other changes).

Cheers,
    Joel


>-- Original Message --
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@parisc-linux.org
>Date: Sun, 2 Nov 2003 15:22:28 -0500
>Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
>do_page_fault?]
>
>
>On Sat, Nov 01, 2003 at 11:27:20PM +0000, Joel Soete wrote:
> Hi Carlos,
> 
> I don't understand anymore anything.
> 
> This afternoon i recompile k 2.4.23-pre9-pa13 + Randolph patch to test
> it. (Ok)
> 
> So I launch evolution which crash at 
>he same place as usual.
> 
> After the diner I restart this c110 with this new kernel but this time,
> no more "do_page_fault() pid=805 command='evolution' type=7". I restart
> it severall time no means to reproduce anymore :(

So it doesn't cras
> anymore? :) 

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
