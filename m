Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id E03374848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 07:56:47 -0600 (MDT)
Date: Thu, 14 Aug 2003 15:56:42 +0200
Message-ID: <3F2A5B04000030E1@ocpmta1.freegates.net>
In-Reply-To: <20030814114653.GJ10015@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
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

>This fill the delayed branch slot (a silly idea, but ...)

Ha Ok (yet another concept for me ;-).  I will look for into architecture
books)

For the moment I am studying TLB miss handling and already have a lot of
questions.

But the very first one: H/W or S/W management (I refer to page 3-9 parisc-2.0:
Adress Resolution and the TLB)?

In the 2 cases, if a fault occurs an interrupt (6, 15, 16,17 or 20) is 'triggered'?

Is a printk() in corresponding handle_interruption() case (kernel/traps.c)
would help?
(if that work, how may I know which processor causes fault?)

Thanks again,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
