Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E63994829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jun 2003 01:14:54 -0600 (MDT)
Date: Tue, 3 Jun 2003 09:14:40 +0200
Message-ID: <3ED70CF100001190@ocpmta2.freegates.net>
In-Reply-To: <200306021732.h52HWKNp010654@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] compiler & kernel
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	joel.soete@tiscali.be
Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org
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

>-- Original Message --
>Subject: Re: [parisc-linux] compiler & kernel
>To: joel.soete@tiscali.be (Joel Soete)
>Date: Mon, 2 Jun 2003 13:32:20 -0400 (EDT)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org
>
>
>> >hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-debs)
> >  seems to work fine but obviously ipt_limit.o is miscompiled:
> >  I can insmod it, but iptable wouldn't recognize the --limit* options.
> >  There are still some problems with some modules
>and canonicalize_funcptr,
> >
> Are you sure this is with hppa64-gcc (iirc canonicalize.., was just 
> recently backport to 3.2)?

> hppa64-gcc does not canonicalize function pointers.

Thanks to confirm (without my full mb I was not quiet sure of my memory :)
)


> >  Man, gcc-3.3 is SLOW! it takes ages to compile the kerne
>!

> I suspect this is related to changes in the inlining model.  This is
> definitely a problem with certain C++ applications. 

I did not observe this behaviour on my b180 b2k or N with gcc-3.3 to compile
various _kernel_ (not C++) 2.4.20 or 2.4.21  (just always anoying canonicalize_
pb and execpted (void *) cast work-around for builtin function, I do not
yet find an easy way to solved module pb)

btw I notice another difference between 32bits and 64bits kernels:
# file vmlinux-2.4.21-rc6-pa35
vmlinux-2.4.21-rc6-pa35: ELF 32-bit MSB ..., statically linked, not stripped

# file vmlinux-2.4.21-rc4-pa35
vmlinux-2.4.21-rc4-pa35: ELF 64-bit MSB ..., dynamically linked (uses share
libs), ...

In the 32-bits case I well understand that kernel was staticaly linked but
I but surprised that 64-bit kernel is dynamically linked? 


> If anybody can
> generate profile and/or pass timing data for 3.3 versus 3.0.4, I
> would like to see them.

Anyway could you let me know how to 'generate this profile'


Thanks for attention,
    Joel

---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
