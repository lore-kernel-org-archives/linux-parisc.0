Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6CBB4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Jun 2003 06:00:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19UPzu-0007Wn-Se; Mon, 23 Jun 2003 13:00:34 +0100
Date: Mon, 23 Jun 2003 13:00:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem during dselect with 2.5.72-pa1
Message-ID: <20030623120034.GB2620@parcelfarce.linux.theplanet.co.uk>
References: <3EF5C964.1040208@bluehash.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3EF5C964.1040208@bluehash.de>
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

On Sun, Jun 22, 2003 at 05:21:08PM +0200, Rüdiger Scholz wrote:
> ------------SNIP-------------
> 
>    kernel BUG at include/linux/swapops.h:68!

*gulp*.  This is pte_file() stuff; i've not been paying attention to that
bit.

>    kernel BUG at mm/rmap.c:343!

.. as is this.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
