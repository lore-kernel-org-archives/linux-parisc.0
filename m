Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8EE9482A
	for <parisc-linux@parisc-linux.org>; Fri, 19 Oct 2001 07:40:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15uZsT-000813-00; Fri, 19 Oct 2001 14:39:57 +0100
Date: Fri, 19 Oct 2001 14:39:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Randolph Chung <randolph@tausq.org>, parisc-linux@parisc-linux.org
Subject: Re: [randolph@tausq.org: [parisc-linux] glibc update]
Message-ID: <20011019143957.A29388@parcelfarce.linux.theplanet.co.uk>
References: <20011017234038.C1060@megatonmonkey.net> <20011018150255.I4123@tausq.org> <20011019011719.C12905@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011019011719.C12905@megatonmonkey.net>; from carlos@megatonmonkey.net on Fri, Oct 19, 2001 at 01:17:19AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 19, 2001 at 01:17:19AM -0400, Carlos O'Donell Jr. wrote:
> You could set the LD_LIBRARY_PATH to the location of the
> objects you are building and then run it...
> 
> However, if you do that, then gdb might act strangely
> with this newly built libc (since ld trying to load gdb
> will use the libc in the library path).
> 
> How do you load gdb with one libc and debug a program
> that uses another?

run gdb, then type
set env LD_LIBRARY_PATH blah blah blah

-- 
Revolutions do not require corporate support.
