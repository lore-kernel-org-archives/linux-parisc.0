Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9695B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 11:26:07 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] linux-2.4.18-pa19 fpu problem
Message-ID: <1019064293.3cbdafe56b7ad@webmail.tiscalinet.be>
Date: Wed, 17 Apr 2002 19:24:53 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be> <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk>
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

Quoting Matthew Wilcox <willy@debian.org>:

> On Wed, Apr 17, 2002 at 11:02:54AM +0200, joel.soete@freebel.net wrote:
> > Here is some trace I get from the kernel (2.4.18-pa19) make (after a
> make
> > oldconfig):
> ...
> > I do think that lacks a header to define some function.
> 
> this code is crufty old HPUX stuff... the warnings have been there
> basically forever, and nobody's bothered to fix them.  Nobody's found a
> problem either :-) If you want to eliminate these warnings by declaring
> everything properly, feel free to send a patch, but I don't think it's
> very important.

Thanks for info.

In fact I test to compile this kernel with gcc-3.2 (snapshot) and severall time
it failled and I suspect wrongly that it could be the cause but it is certainly
somewhere else (don't rememnber exactly). Never the less  I will try to make
this patch.

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
