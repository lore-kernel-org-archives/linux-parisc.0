Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF3C64829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 11:30:07 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 1919TS-0005Qj-MQ; Thu, 03 Apr 2003 19:30:06 +0100
Date: Thu, 3 Apr 2003 19:30:06 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ricardo Jose Guevara Ochoa <jguevara@unitec.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel boot error
Message-ID: <20030403183006.GG29376@parcelfarce.linux.theplanet.co.uk>
References: <4dfbf44c74795b8f.74795b8f4dfbf44c@unitec.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4dfbf44c74795b8f.74795b8f4dfbf44c@unitec.edu>
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

On Thu, Apr 03, 2003 at 12:10:44PM -0600, Ricardo Jose Guevara Ochoa wrote:
> I tried to boot the linux kernel 2.4.20pa32, and it gave me this error:
> 
> Boot device can't seek past 2gb( ignore next error ).byteio_read: 
> seekreed()return -1 excepted 2048
> ext2_get:read errorError: open /kernel/linux/vmlinux from partition 2 
> failed

your /boot partition extends above the 2GB boundary.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
