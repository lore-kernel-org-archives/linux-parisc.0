Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10E55482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 May 2002 08:08:55 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Message-ID: <1020866871.3cd931378ecc1@webmail.tiscalinet.be>
Date: Wed, 08 May 2002 16:07:51 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1020756305.3cd7815151303@webmail.tiscalinet.be> <1020787573.3cd7fb75053c7@webmail.tiscalinet.be> <20020507174619.GO32033@tausq.org> <1020837586.3cd8bed27dc62@webmail.tiscalinet.be> <20020508061905.B21381@systemhalted>
In-Reply-To: <20020508061905.B21381@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: kdb recipe
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

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> Joel,
> 
> The following recipe might help:
> 
> ---
> mkdir kdb-parisc
> cd kdb-parisc
> export CVSROOT=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs
> cvs login
> cvs co linux
> cvs co palo
> mkdir kdb
> cd kdb
> wget
> ftp://oss.sgi.com/projects/kdb/download/v2.1/kdb-v2.1-2.4.18-common-3.bz2
> bunzip2 kdb-v2.1-2.4.18-common-3.bz2
> wget
> http://www.baldric.uwo.ca/~carlos/kdb-parisc/kdb-v2.1-2.4.18-pa23-parisc.bz2
> bunzip2 kdb-v2.1-2.4.18-pa23-parisc.bz2
> cd ../linux
> patch -p1 < ../kdb/kdb-v2.1-2.4.18-common-3
> patch -p1 < ../kdb/kdb-v2.1-2.4.18-pa23-parisc
> make oldconfig (Answer CPU and KDB questions)
> (You can alternatively configure other things)
> make dep
> make palo
> ---
> 
> I won't be maintaining kdb patches outside the CVS try anymore, 
> so the second wget will soon become a cvs checkout.
> 
> c.
> 
> 
Many thanks for explanation.

Right now, I just update the kdb21 branch that Paul update for -pa24 stuff.

Unfortunately I do not reach to boot it (test it with gcc-3.0.4 and gcc-3.1 co
two days ago). It seems to hang just after the message:
"...
a common symtom -- search the FAQ ..."

I also check that I can boot 2.4.18-pa24: 
    gcc 3.0.4 ok
    gcc 3.1 hang just after Freeing Init mem (364k)

Well I let you work and I will update kdb branch latter and try again.

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
