Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8493B482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 15:47:59 -0600 (MDT)
Date: Tue, 23 Apr 2002 17:47:58 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <20020423174758.C8545@systemhalted>
References: <3CC2B937.8020509@freebel.net> <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk> <20020423111903.A8545@systemhalted> <1019582168.3cc596d87ba8a@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1019582168.3cc596d87ba8a@webmail.tiscalinet.be>; from joel.soete@freebel.net on Tue, Apr 23, 2002 at 07:16:08PM +0200
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
> Joel
> 
> PS1: about step 4.2 of your howto-xc, I notice a small difference between html
> and pdf (in html you use gcc option "enable-shared" in pdf "disable-shared").
> But this not the cause of the above problem.
> 
> PS2: I also make an apt-get dist-upgrade (with ftp.de.debian.org) so that native
> gcc is now 3.0.4-5 (I think it was already installed last week)
> 
>

Both the HTML and PDF version are the same (just double checked).

http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/index.html
http://www.baldric.uwo.ca/~carlos/HOWTO-Parisc/HOWTO-Building_PARISC-LINUX_CrossCompiler.pdf

In section 4.2 you are bootstraping the C compiler without glibc
so you must use --disable-shared.

In section 4.5 you have already built glibc and you can turn
shared support back on with --enable-shared.

c.

p.s. The HTML and PDF do have some formatting differences...
     I'll get around to making them look similar later :}
     Dang... just noticed I missed one of the path changes in
     the pdf...
