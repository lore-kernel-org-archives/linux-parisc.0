Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 931CD4832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 10:40:41 -0600 (MDT)
Date: Wed, 14 May 2003 18:40:30 +0200
Message-ID: <3EC0FF230000091A@ocpmta7.freegates.net>
In-Reply-To: <200305121624.h4CGOMq1001557@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] [PATCH-2.5] Various cleanups
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, randolph@tausq.org
Cc: jbglaw@lug-owl.de, parisc-linux@lists.parisc-linux.org
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

>> how does that work? __c_f_f_c is emitted by the compiler internally,
>> right? how can we define an inline version of this function?
>
>Dooh, you are correct.  I wrote a little test program and the libcall
>doesn't get inlined.
>
>So if no canonicalization is needed, you want something like:
>
>typedef int (*fptr_t) (void);
>
>unsigned int __canonicalize_funcptr_for_compare (fptr_t)
>      __attribute__ ((visibility ("hidden")));
>
>unsigned int
>__canonicalize_funcptr_for_compare (fptr)
>   fptr_t fptr;
>{
>  return (unsigned int)fptr;
>}
>
>The libgcc version is hidden.  That's because shared libraries need
>their own copy which accesses the got table in the shared library.
>Probably in the kernel implementation, a single copy of the routine
>is sufficient and you don't want the hidden attibute.
>
Hi all,

I just try to build a kernel with following stuff:
add first include/asm-parisc/fptr.h:

typedef int (*fptr_t) (void);

extern unsigned int __canonicalize_funcptr_for_compare (fptr_t)
      __attribute__ ((visibility ("hidden")));


and arch/parisc/lib/fptr.c 


#include <asm/fptr.h>

unsigned int
__canonicalize_funcptr_for_compare (fptr)
     fptr_t fptr;
{
    return (unsigned int) fptr;
}

also arch/parisc/kernel/parisc_ksyms.c:
[...]
#include <asm/fptr.h>  
EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);


to finaly arch/parisc/lib/Makefile:
-obj-y   := lusercopy.o bitops.o checksum.o io.o memset.o
+obj-y   := lusercopy.o bitops.o checksum.o io.o memset.o fptr.o

The compile seems ok but knowing not yet anything about modules I would appreciate
your advises before trying to boot it.

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
