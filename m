Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10AB04841
	for <parisc-linux@parisc-linux.org>; Sun,  9 Nov 2003 12:27:52 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id hA9JRhY21725;
	Sun, 9 Nov 2003 14:27:43 -0500
Subject: Re: [parisc-linux] 2.4 64bits MAX_ADDRESS ?
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <soete.joel@tiscali.be>, parisc-linux@parisc-linux.org
In-Reply-To: <20031109174832.GD2014@parcelfarce.linux.theplanet.co.uk>
References: <3FAE7B44.6020805@tiscali.be>
	<20031109174832.GD2014@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 09 Nov 2003 13:27:40 -0600
Message-Id: <1068406064.1658.9.camel@mulgrave>
Mime-Version: 1.0
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

On Sun, 2003-11-09 at 11:48, Matthew Wilcox wrote:
> no, long is 64-bit in LP64.  that's what LP64 means.

What Matthew says is correct for the kernel.  You got your error because
you look to have compiled your program in userspace with kernel
headers.  Since userspace is currently only 32 bit, that's why you get
the problems. 

If you want to try out 64 bit userspace, which is the only way userspace
will see a virtual address longer than 32 bits, then there's a
preliminary test environment at

http://parisc-linux.org/~jejb/64bit.tar.gz

The mini library may be sufficient to compile your program.

James
