Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8882C4835
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 11:17:53 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <1019582168.3cc596d87ba8a@webmail.tiscalinet.be>
Date: Tue, 23 Apr 2002 19:16:08 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <joel.soete@freebel.net>,
	Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
References: <3CC2B937.8020509@freebel.net> <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk> <20020423111903.A8545@systemhalted>
In-Reply-To: <20020423111903.A8545@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hello Carlos,

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> > > "Stack pointer and cr30 do not correspond!
> > > Dumping virtual address stack instead
> > > 
> > > Dumping Stack from ... to ...:
> > > 
> > > Humm as it appends as well with telnet as ssh I suspect a inetd
> problem?
> > 
> > I'd bet on gcc-3.2 miscompiling something in the network part of the
> kernel,
> > personally.
> >
> 
> Tested today.
> 
> Happens in the 3.1 main branch aswell (don't remember it previously
> happening).
> Maybe I shouldn't be recommending the use of 3.1 as a cross compiler?
> ;)

I also notice it on 3.1 about two mount ago (that is why I do another try with 3.2)


> 
> I'll kdb on a serial tommorow morning and see what is causing it to
> die.
> 

I would also to do so. But I had the bad idea to co the last gcc release
(yesterday and today) to rebuild the toolchain.
But gcc build seems to be broken (step 4.2 of your procedure):

gcc -c -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes   -DHAVE_CONFIG_H    -I. -Ijava
-I/GNU-Dev/parisc-linux/src/gcc/gcc -I/GNU-Dev/parisc-linux/src/gcc/gcc/java
-I/GNU-Dev/parisc-linux/src/gcc/gcc/config
-I/GNU-Dev/parisc-linux/src/gcc/gcc/../include
/GNU-Dev/parisc-linux/src/gcc/gcc/java/parse.c -o java/parse.o
/tmp/ccj2Nlrs.s: Assembler messages:
/tmp/ccj2Nlrs.s:148746: Error: Field out of range [-262144..262143] (-263392).
make[1]: *** [java/parse.o] Error 1
make[1]: Leaving directory `/GNU-Dev/parisc-linux/build/gcc/gcc'
make: *** [all-gcc] Error 2

Last week co did not try to build any java.
Any idea or work-around?

Joel

PS1: about step 4.2 of your howto-xc, I notice a small difference between html
and pdf (in html you use gcc option "enable-shared" in pdf "disable-shared").
But this not the cause of the above problem.

PS2: I also make an apt-get dist-upgrade (with ftp.de.debian.org) so that native
gcc is now 3.0.4-5 (I think it was already installed last week)




-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
