Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 303E34851
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Apr 2002 07:52:14 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	INVALID_ADDRESS@.SYNTAX-ERROR
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <1019656229.3cc6b825cce64@webmail.tiscalinet.be>
Date: Wed, 24 Apr 2002 15:50:29 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <joel.soete@freebel.net>,
	Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
References: <3CC2B937.8020509@freebel.net> <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk> <20020423111903.A8545@systemhalted> <1019582168.3cc596d87ba8a@webmail.tiscalinet.be>
In-Reply-To: <1019582168.3cc596d87ba8a@webmail.tiscalinet.be>
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

Quoting joel.soete@freebel.net:

> 
> gcc -c -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes
> -Wmissing-prototypes   -DHAVE_CONFIG_H    -I. -Ijava
> -I/GNU-Dev/parisc-linux/src/gcc/gcc
> -I/GNU-Dev/parisc-linux/src/gcc/gcc/java
> -I/GNU-Dev/parisc-linux/src/gcc/gcc/config
> -I/GNU-Dev/parisc-linux/src/gcc/gcc/../include
> /GNU-Dev/parisc-linux/src/gcc/gcc/java/parse.c -o java/parse.o
> /tmp/ccj2Nlrs.s: Assembler messages:
> /tmp/ccj2Nlrs.s:148746: Error: Field out of range [-262144..262143]
> (-263392).
> make[1]: *** [java/parse.o] Error 1
> make[1]: Leaving directory `/GNU-Dev/parisc-linux/build/gcc/gcc'
> make: *** [all-gcc] Error 2


Forget. The actual problem was again typo: in configure step I type
'enable-langages=c' in place of 'enable-languages=c' (lack of a u between g & a).

Sorry for mistakes.
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
