Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 799C0482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 20:39:03 -0700 (MST)
Date: Thu, 15 Nov 2001 20:39:01 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit kernels boot on C200 (finally) :)
Message-ID: <20011115203901.A8837@beavis.ybsoft.com>
References: <20011115123203.A2337@beavis.ybsoft.com> <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011115200102.E25491@parcelfarce.linux.theplanet.co.uk>
From: rbradetich@uswest.net (Ryan Bradetich)
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

[ Snip ]
> i'm surprised the network works given the number of warnings when compiling
> lasi_82596.c with a 64-bit compiler.

it does ... that was over a nfs root.  I plan on taking a look at the compiler
warnings here shortly.  But I have not tested out how much works on the C200+
with a 64-bit kernel ... I have no idea if scsi works, etc.  I will play with
it more and see what is br0k3n.... I was just happy to see the login prompt.

> btw, does a 64-bit kernel with the 32-bit wrapper options enabled boot
> on a PAT PDC box like A500?

I'm not sure if I understand the question, so let me try to restate the
question I think you are asking.

If you compile in 32-bit wrapper support into a 64-bit kernel ... can
the same kernel be used on a PAT PDC box like the A500? 

  No.  When I first started down the 32-bit wrapper support, I was going
  to make the wrappers smart and use the 32-bit wrappers when needed.  I
  was talked out of the idea, because on all the boxes that need the
  32-bit wrappers do not support > 4G ram, thus there is no advantage
  (yes Grant, I know ... some application do benefit from 64-bit kernels)
  for running a 64-bit kernel on them.  The PDC wrappers are designed to
  be used for developement/testing purposes for people with these systems.
  (By Making the wrappers a compile time option, it saves an additional
   level of indirection for every pdc call).


That help?  If not, I'll try again.

- Ryan
