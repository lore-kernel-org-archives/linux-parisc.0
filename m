Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA05954
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 05:40:51 -0700
Received: at Infodrom Oldenburg (/\##/\ Smail-3.2.0.102 1998-Aug-2 #2)
	by finlandia.Infodrom.North.DE
	via smail from stdin
	id <m11kRdu-000bB2C@finlandia.Infodrom.North.DE>
	for parisc-linux@thepuffingroup.com; Sun, 7 Nov 1999 13:41:58 +0100 (CET)
Date: Sun, 7 Nov 1999 13:41:58 +0100
From: Martin Schulze <joey@finlandia.Infodrom.North.DE>
To: Andi <der_fisch@fischlustig.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: cant use  rbootd
Message-ID: <19991107134158.Z9767@finlandia.infodrom.north.de>
Reply-To: Martin Schulze <joey@infodrom.north.de>
References: <199911030250.TAA16563@puffin.external.hp.com> <19991106192023.F11609@mathe.stud.uni-erlangen.de> <19991107125314.N25252@mencheca.ch.genedata.com> <99110713214800.00507@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99110713214800.00507@beavis>
List-ID: <linux-parisc.vger.kernel.org>

Andi wrote:
> Hi,
> 
> I am using an rbootd running on Debian 2.1 , but my HP 712/60 cant find it, I
> put the correct ethernet adress in the /etc/rbootd.conf

I guess you'll need the Puffins patch applied.  The patch is available
in the upcoming unstable aka 2.2 of Debian - I hope... In any case you'll
find a non-official package at http://master.debian.org/~joey/NMU/ .  On
2.1 box you'll need to recompile it.

Regards,

	Joey

-- 
Beware of bugs in the above code; I have only proved it correct,
not tried it.  -- Donald E. Knuth
