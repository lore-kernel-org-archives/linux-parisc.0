Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 822D1482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 13:30:10 -0600 (MDT)
Date: Mon, 11 Aug 2003 15:27:23 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811192723.GF20106@systemhalted>
References: <20030811152442.GB20405@dsl2.external.hp.com> <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca> <20030811190914.GA25311@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030811190914.GA25311@dsl2.external.hp.com>
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

jda,

> LIBRARY_PATH        = /usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/lib/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../:/lib/hppa-linux/3.3.1/:/lib/:/usr/lib/hppa-linux/3.3.1/:/usr/lib/
> 
> /usr/bin/ld --eh-frame-hdr -dynamic-linker /lib/ld.so.1 -o glxinfo /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crt1.o /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crti.o /usr/lib/gcc-lib/hppa-linux/3.3.1/crtbegin.o -L../../exports/lib -L/usr/lib/gcc-lib/hppa-linux/3.3.1 -L/usr/lib/gcc-lib/hppa-linux/3.3.1/../../.. 

I'm pretty sure according to our discussion on the proper placement of
libgcc_eh that there is a missing "-lgcc_eh" right here (or rather the
next one should be _after_ the crtbegin?). See the wrapping -lgcc_eh 
around -lc and -lgcc

glxinfo.o -lGLU -lGL -lXext -lX11 -lpthread -lm -lgcc_eh -rpath-link ../../exports/lib -lgcc -lgcc_eh -lc -lgcc -lgcc_eh /usr/lib/gcc-lib/hppa-linux/3.3.1/crtend.o /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crtn.o
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> /usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> ../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> /usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> collect2: ld returned 1 exit status
> [Leaving /tmp/ccAA0Eun.c]
> [Leaving /tmp/cc0QBMNA.o]
> [Leaving /tmp/ccGtmF6N.ld]
> [Leaving glxinfo]
> grundler@gsyprf11:/usr/src/xfree86-4.2.1/build-tree/xc/programs/glxinfo$ 

This is an issue we've seen in the detection of unwind info from
autoconf. Glibc has a patch to hack around a proper detection by placing
the appropirate -lgcc_eh in the front.

c.
