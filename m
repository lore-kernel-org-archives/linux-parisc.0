Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CE804A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 13:01:54 -0700 (MST)
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, amodra@linuxcare.com
Subject: Re: [parisc-linux] $$mulI missing 
In-Reply-To: Your message of "Thu, 01 Feb 2001 11:46:47 PST."
             <200102011946.LAA01082@milano.cup.hp.com>
References: <200102011946.LAA01082@milano.cup.hp.com> 
Date: Thu, 01 Feb 2001 13:01:52 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14OPvU-0006yu-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= I enabled "CONFIG_MODULES" to build a 64-bit kernel
= and got the following link error:
= arch/parisc64/kernel/kernel.o(__ksymtab+0x300): undefined reference to `$$mul
I'
= 
= I'll try to work around it by using HPUX's 64-bit libmilli.a.

I didn't think the 64-bit compiler used mulI so didn't include it
in the millicode routines.  I'm curious what's using it.  I can
port the HP multiply routines if needed but want to make sure it's
really needed...

	-P
