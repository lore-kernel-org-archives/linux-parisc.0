Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54373482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Aug 2003 06:21:24 -0600 (MDT)
Date: Tue, 12 Aug 2003 14:21:18 +0200
Message-ID: <3F29178A00002C09@ocpmta7.freegates.net>
In-Reply-To: <20030812035810.GB9325@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org,
	"LaMont Jones" <lamont@hp.com>
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

>Assembles, and boots on my C3K, 32-bit kernel. Looking for any takers
>who want to try  it in 64-bit mode. I'm running lmbench to see if I can
>tell the difference between this and the original code. 
>
>I would be most appreciative if anyone would pipe up and say "Run X to
>test if Y works better/faster/harder" :}

I apply your patch against 2.4.21-pa9 on the N-4000 and compile it successfully
with hppa64-linux-gcc (3.2.3). (having no clue about lmbench) I take this
exercise to roughly compare. 

Running the original 2.4.21-pa9 here are times:
Tue Aug 12 09:59:55 CEST 2003
[...] # Build kernel: 19'58"
Tue Aug 12 10:19:53 CEST 2003
[...] # Build modules: 7'46"
Tue Aug 12 10:27:39 CEST 2003

Running this new kernel:

Tue Aug 12 12:28:37 CEST 2003
[...] # Build kernel: 20'8"
Tue Aug 12 12:48:45 CEST 2003
[...] # Build modules: 7'47"
Tue Aug 12 12:56:32 CEST 2003

The difference are so small that a more accurate tools would be requested.

hth anyway,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
