Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 016ED4899
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 10:03:33 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 bootstrap?
Message-ID: <1026835409.3d3443d1d1cbd@webmail.tiscalinet.be>
Date: Tue, 16 Jul 2002 18:03:29 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <200207161516.g6GFGZ8C023053@hiauly1.hia.nrc.ca>
In-Reply-To: <200207161516.g6GFGZ8C023053@hiauly1.hia.nrc.ca>
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> 
> Possibilities are:
> 
>   1) you either didn't install what you built.
>   2) you moved stuff around so libgcc couldn't be found.
>   3) libgcc.a didn't build when you built your cross.
>   4) linker script didn't link in libgcc.a.
> 
> $$mulU is a millicode routine in libgcc.a.

Humm?
In the debian package gcc-3.0 I found this lib and
strings /usr/lib/gcc-lib/hppa-linux/3.0.4/libgcc.a | grep mulU
show me well two entries.
but in ./native/lib/gcc-lib/hppa-linux/3.2 (as well in ./cross) I do not found
anything like this.
So this is a 5th possibility: the procedure used failled to build correctly this
lib (at least?)

> 
> > Or would it be better to continue with xcompiler hppa->hppa?
> 
> You are just adding more complication to the process trying to use
> ia64.

Oops I wrongly explain (sorry for confusion): I do not use ia64, I just use this
procedure as a model.
I change just enough to run it on my hppa-linux box (a b2000 here) but without
success :(. I still have a lot to learn.

Thanks for info,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
