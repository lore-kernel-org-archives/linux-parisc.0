Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 847AF4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 10:36:10 -0600 (MDT)
Date: Thu, 17 Jul 2003 18:36:05 +0200
Message-ID: <3F0BEA8300002143@ocpmta1.freegates.net>
In-Reply-To: <20030717160551.GP30257@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
To: "Randolph Chung" <tausq@debian.org>,
	"James Bottomley" <James.Bottomley@steeleye.com>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"PARISC list" <parisc-linux@lists.parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
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

Hi Randolph,

> but to rule this out, joel, can you recompile your kernel without
> modules (everything builtin) and see what happens?

It is :(

(for those first test I build it with make defconfig and just change sym1
to sym2 which works fine on my b180. And so I just check to be sure # CONFIG_MODULES
is not set)

Joel

ps: I am on going to test init=/bin/fs... 

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
