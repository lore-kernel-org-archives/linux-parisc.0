Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F66E482A
	for <parisc-linux@parisc-linux.org>; Thu, 17 Jan 2002 18:13:55 -0700 (MST)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200201180113.RAA06216@opus.allegro.com>
Subject: Re: [parisc-linux] long double
To: drepper@redhat.com
Date: Thu, 17 Jan 2002 17:13:51 -0800 (PST)
Cc: willy@debian.org (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <m36660a3qx.fsf@myware.mynet> from "Ulrich Drepper" at Jan 17, 2002 04:42:46 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Re:

[(stuff about how big "long double" is)]

> > (3) Change both gcc and glibc to think that long double is actually
> > 128-bits wide.
> 
> This is definitely what you should do.  glibc includes now a full set
> of 128-bit math functions.  They should be used everywhere the ABI are
> not demanding the braindamaged 96-bit format.  Even Alpha, PPC, etc
> will change to this when time comes.


That's why I use: real32, real64, real128 :)

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
