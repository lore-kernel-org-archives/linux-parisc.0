Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88D454840
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Oct 2003 03:50:01 -0600 (MDT)
Date: Tue, 7 Oct 2003 11:49:52 +0200
Message-ID: <3F5CC41F0000EAB9@ocpmta3.freegates.net>
In-Reply-To: <20031006173401.GE27512@systemhalted>
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

Hi Carlos,

>>
>>On Mon, Oct 06, 2003 at 06:21:50PM +0200, Joel Soete wrote:
>> Finaly it works on my c110 and also on a b180l :)
>> 
>> But, as we could awaiting when such code=13 (conditional trap iirc), occurs
>> in kernel mode (as on my b2k or Max's c3k) the kernel
>>hang without advise
>> :(
>
>It happens in "kernel mode" ?

That is what said the original oops (a bug in init of console)?

> That should trigger an oops? It's a SIGFPE for the kernel :)

I so need more work

Thanks,
    Joel


-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
