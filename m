Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.kdt.de (mail.kdt.de [195.8.224.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DD02482A
	for <parisc-linux@parisc-linux.org>; Thu,  7 Jun 2001 10:48:55 -0600 (MDT)
Sender: aj@suse.de
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [aj@suse.de: Re: Remove multiline asm statements]
References: <20010606102430.V25417@zumpano.fc.hp.com>
	<20010607092322.E12263@bubble.local>
From: Andreas Jaeger <aj@suse.de>
Date: 07 Jun 2001 08:30:45 +0200
In-Reply-To: <20010607092322.E12263@bubble.local> (Alan Modra's message of "Thu, 7 Jun 2001 09:23:22 +0930")
Message-ID: <u8ae3kkdii.fsf@gromit.moeb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <amodra@bigpond.net.au> writes:

>> > diff -urNx CVS glibc-223/sysdeps/hppa/dl-machine.h glibc-merge/sysdeps/hppa/dl-machine.h
>> > --- glibc-223/sysdeps/hppa/dl-machine.h	Fri Apr 27 14:31:02 2001
>> >+++ glibc-merge/sysdeps/hppa/dl-machine.h	Mon May  7 15:25:44 2001
>> > @@ -75,11 +82,11 @@
>> >  
>> >  #if 0
>> >    /* Use this method if GOT address not yet set up.  */
>> 
>> Can we remove the #if 0 code?
> 
> Yes.

Shall I just commit the obvious patch?

Andreas
-- 
 Andreas Jaeger
  SuSE Labs aj@suse.de
   private aj@arthur.inka.de
    http://www.suse.de/~aj
