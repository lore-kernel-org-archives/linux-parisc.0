Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1024B488A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 10:28:32 -0700 (MST)
Date: Fri, 6 Feb 2004 18:08:13 +0100
Message-ID: <40218AE20000180F@ocpmta2.freegates.net>
In-Reply-To: <20040206191631.GQ959@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb
To: "Randolph Chung" <tausq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Randolph,

> did you do clearpim before the run?
Yes

> The values in the pim info don't make a lot of sense....
Not more sense with previous one I got, that's why it takes me so much time
to find  a workaround ;)

> did the box HPMC?
Yes that's what showing the small lcd on the box and seems to be confirm
by hpmc time stamp ;)

> did it hang and then you hit the TOC button?
NO. Just after the last advise of palo (... If this is the last message...)
appears very quickly the message on the lcd: hpmc init... (even if I put
printk() at the very begining of init code in main.c nothing is printed on
the serial console.

I also suspected a long time the compiler I used but recently I put this
same kernel (scp) on the N4K-550 and it boot fine (but this system has 2Gb
of ram)

And because 2.4 64bits runing fine on this system (b2k) and the pb should
be located very early at the begining of the kernel start, I had the idea
to compare head64.S and vmlinux.lds.S and find back this 2.5 patch and try
to revert it. But I very don't undurstand what happen in head64 to hope to
help more efficiently :( (sorry) 

Thanks for your attention,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
