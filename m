Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15697486C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 09:32:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18uxWw-0000IV-9Z; Mon, 17 Mar 2003 16:32:06 +0000
Date: Mon, 17 Mar 2003 16:32:06 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] /lib/ld.so.1 (glibc) issues on 2.5 kernel??
Message-ID: <20030317163206.GE28607@parcelfarce.linux.theplanet.co.uk>
References: <1047917954.14507.15.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1047917954.14507.15.camel@beavis.ybsoft.com>
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

On Mon, Mar 17, 2003 at 09:19:14AM -0700, Ryan Bradetich wrote:
> Linux vega 2.5.64-pa5 #3 Sun Mar 16 23:44:38 MST 2003 parisc unknown
> unknown GNU/Linux
> rbrad@vega:~$ /lib/ld.so.1 --verify /bin/sh
> Inconsistency detected by ld.so: rtld.c: 879: dl_main: Assertion
> `_rtld_local._dl_rtld_map.l_libname' failed!
> rbrad@vega:~$
> 
> With the same system, but running the 2.4 kernel .... everything
> seems to work fine.

Hmm.  Back in 2.4, we had an RGH_HACK in fs/binfmt_elf.c which (iirc)
was introduced to stop this error.  I'm not sure we ever tracked down the
problem this was solving, but we thought it'd gone away with recent glibc.

I guess not.  I'm reluctant to bring the RGH_HACK forwards... but if
someone did, it might help track down where this problem really is.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
