Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43973482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 07:47:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15rgBC-0006Bq-00; Thu, 11 Oct 2001 14:47:18 +0100
Date: Thu, 11 Oct 2001 14:47:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.2.4-2 No Optimizations = No Compliation
Message-ID: <20011011144718.A22924@parcelfarce.linux.theplanet.co.uk>
References: <20011011073101.B5637@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011073101.B5637@megatonmonkey.net>; from carlos@megatonmonkey.net on Thu, Oct 11, 2001 at 07:31:01AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 11, 2001 at 07:31:01AM -0400, Carlos O'Donell Jr. wrote:
> With the hopes of compiling the library with less optimizations
> and tracing through some saner PARISC assembly.

I dunno... I oftn find optimised easier to read.

> I've noticed that glibc-2.2.4/config.h.in (eventually becomes
> config.h) throws an error if glibc is compiled wihtout 
> optimizations.
> 
> "#error glibc cannot be compiled without optimizations"

I don't know.  But I guess glibc needs to inline something, and this doesn't
happen below -O1.

-- 
Revolutions do not require corporate support.
