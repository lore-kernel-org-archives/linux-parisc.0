Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18DBA482A
	for <parisc-linux@parisc-linux.org>; Wed,  6 Jun 2001 10:24:32 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id 67D83141B
	for <parisc-linux@parisc-linux.org>; Wed,  6 Jun 2001 12:24:31 -0400 (EDT)
Date: Wed, 6 Jun 2001 10:24:30 -0600
To: parisc-linux@parisc-linux.org
Message-ID: <20010606102430.V25417@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] [aj@suse.de: Re: Remove multiline asm statements]
List-ID: <linux-parisc.vger.kernel.org>

I don't know the answer to this.  Anyone?

----- Forwarded message from Andreas Jaeger <aj@suse.de> -----

Delivered-To: willy@ldl.fc.hp.com
Mail-Copies-To: never
To: willy@ldl.fc.hp.com (Matthew Wilcox)
Cc: libc-alpha@sources.redhat.com
Subject: Re: Remove multiline asm statements
From: Andreas Jaeger <aj@suse.de>
Date: 06 Jun 2001 13:52:58 +0200
In-Reply-To: <20010605235813.A27862@ldl.fc.hp.com> (willy@ldl.fc.hp.com's message of "Tue, 5 Jun 2001 23:58:13 -0600")
User-Agent: Gnus/5.090004 (Oort Gnus v0.04) XEmacs/21.4 (Academic Rigor)

willy@ldl.fc.hp.com (Matthew Wilcox) writes:

> 2001-06-05  Matthew Wilcox  <willy@ldl.fc.hp.com>
> 
> 	* sysdeps/hppa/dl-machine.h: Reformat asm statements to remove new
> 	  gcc warning about multi-line strings.
> 
> diff -urNx CVS glibc-223/sysdeps/hppa/dl-machine.h glibc-merge/sysdeps/hppa/dl-machine.h
> --- glibc-223/sysdeps/hppa/dl-machine.h	Fri Apr 27 14:31:02 2001
>+++ glibc-merge/sysdeps/hppa/dl-machine.h	Mon May  7 15:25:44 2001
> @@ -75,11 +82,11 @@
>  
>  #if 0
>    /* Use this method if GOT address not yet set up.  */

Can we remove the #if 0 code?

I've committed your patch,
Andreas
-- 
 Andreas Jaeger
  SuSE Labs aj@suse.de
   private aj@arthur.inka.de
    http://www.suse.de/~aj

----- End forwarded message -----

-- 
It's always legal to use Linux (TM) systems
http://www.gnu.org/philosophy/why-free.html
