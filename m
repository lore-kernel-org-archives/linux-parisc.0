Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 202FF482A
	for <parisc-linux@parisc-linux.org>; Wed,  5 Jun 2002 11:17:29 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
Message-ID: <1023297439.3cfe479fcd5b9@webmail.tiscalinet.be>
Date: Wed, 05 Jun 2002 19:17:19 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
In-Reply-To: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
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

> > It seems to be well comited in last cvs update this morming I got in
> > src/gcc/gcc/fixinc/inclhack.def:
> > ...
> > /*
> >  * __thread is now a keyword.
> >  */
> 
> > But do not seems to be applied as I got the same error?
> > 
> > What do I wrong or forget to do?
> 
> You should see the following in your build output:
> 
> Applying thread_keyword           to pthread.h
> Fixed:  pthread.h
> 
> A fixed pthread.h should appear in the {build}/gcc/include directory.
> This seems to work ok for me in a native hppa-linux build.


With build toolchain procedure I build well a cross compiler hppa to hppa?

Also I would like to compare the results with a gcc hppa-linux native build when
I compile the kernel with gcc-3.1 (or 3.2) and see if the same network problem
occurs.

But in that case I ignore what parameters I would have to use to configure and
compile gcc natively. Can you still help me?

Thanks in advance,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
