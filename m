Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BA0B48B2
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 10:21:55 -0600 (MDT)
Date: Mon, 6 Oct 2003 18:21:50 +0200
Message-ID: <3F5CB6FB0000DD78@ocpmta1.freegates.net>
In-Reply-To: <20031006143319.GC27512@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on b2k finaly crash]
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
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

>>
>>On Sun, Oct 05, 2003 at 03:06:48PM +0000, Joel Soete wrote:
>> Hi Carlos and all,
>> 
>> Regarding a bit more about this crash dump, I figure out that your patch

>> ><http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017565.html>

> 
>>as not yet 'aligned' in 2.6.
>> So may I suggest you this first draft:
>
>The draft looks good. I'll merge it into 2.6 today and test on my
>system.

Finaly it works on my c110 and also on a b180l :)

But, as we could awaiting when such code=13 (conditional trap iirc), occurs
in kernel mode (as on my b2k or Max's c3k) the kernel hang without advise
:(

Thanks for your attention,
    Joel


-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
