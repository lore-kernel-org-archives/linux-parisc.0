Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 922B9482D
	for <parisc-linux@parisc-linux.org>; Wed, 16 Jul 2003 11:30:32 -0600 (MDT)
Date: Wed, 16 Jul 2003 19:30:29 +0200
Message-ID: <3F0C24F800000FDD@ocpmta8.freegates.net>
In-Reply-To: <1058212036.2966.13.camel@mulgrave>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] [PATCH] fix arbitrary limits on stack size
To: "James Bottomley" <James.Bottomley@steeleye.com>
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

>
>On Mon, 2003-07-14 at 05:48, Joel Soete wrote:
> I don' t remember the historical reason of this choice but do you think
it
> is possible to back-port it into 2.4 (it will facilitate so much the merge
> with upstream?)

>Well, I suppose, theoretically.

> However, before we consider backporting, what I really need is for
> people to test it. 

Ok Jame, Now I have a 32bits 2.6.0-test1-pa1 running so I come back to you.

No problem to apply it :) , so I can launch the compile.

Just a question in the mean time: it doesn't seens that your patch take care
of CONFIG_STACK_GROWSUP in related files?

Thanks,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
