Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E58194A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 18:00:57 -0700 (MST)
Message-Id: <200103230054.RAA24759@puffin.external.hp.com>
To: Nicolas THOMAS <thomas@ispserv.grenoble.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interoperability 
In-Reply-To: Your message of "22 Mar 2001 13:22:03 +0100."
             <o051yrqc7tg.fsf@debian.grenoble.hp.com>
Date: Thu, 22 Mar 2001 17:54:36 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Nicolas THOMAS wrote:
> Does anyone of you have references/URL/opinion.... on interoperabilty
> purpose?

Could you provide details on what you mean by "interoperability"?
(Or specific applications that you need to run if you don't need
to build them from scratch)

> The systems I would like to be able to interoperate are :
> - Linux x86
> - Linux PA-risc 32bits
> - Linux PA-risc 64bits
> - HP-UX 11 64bits

Obviously not all four can run the same application binaries.
I do expect a pretty good level of source compatibility (90%+).
On the PARISC OS's, even a degree of binary compatibility.

Provided details, I can forward things not covered by HPUX to the
right people (caveat: no guarantee they will get fixed...).  And
you are welcome to post patches for stuff in either 32 or 64-bit
parisc-linux kernels here.
(Or submit bug reports to bugs.parisc-linu.org.)


> I already know the STK: http://devresource.hp.com/STK/

Also try:
    http://devresource.hp.com/OpenSource/Tools/OpenSourceLib.html
         (I think this might be the same/related to the STK)
    http://devresource.hp.com/LPK/

The LPK (Linux Porting Kit) seems to be pretty good (though not perfect).

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
