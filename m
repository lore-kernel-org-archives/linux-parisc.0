Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84F07482A
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 22:28:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 153s8x-0002w8-00; Sun, 27 May 2001 05:27:07 +0100
Date: Sun, 27 May 2001 05:27:07 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: bame@debian.org
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] some information on apt woes
Message-ID: <20010527052707.J23718@parcelfarce.linux.theplanet.co.uk>
References: <m153rqb-001VltC@bame.riverrock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m153rqb-001VltC@bame.riverrock.org>; from bame@debian.org on Sat, May 26, 2001 at 10:08:09PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 26, 2001 at 10:08:09PM -0600, bame@debian.org wrote:
>     One current parisc apt failure mode of both 0.4.0 and 0.5.3 appears
>     to be a kernel VM problem though that doesn't make sense since the
>     variable to make 0.4.0 fail is to update to glibc 2.2.3 from 2.2.1
>     unless it's just the right change to the memory map to tweek some bug.

The faults I've seen from 0.4.0 are very different from those which
you report.  0.4.0 segfaults during exit as it attempts to execute code
in the dynamic linker (possibly a destructor?), after the dynamic linker
has been unmapped.

The 0.5.3 crashes I've seen look more like dereferencing random data.

-- 
Revolutions do not require corporate support.
