Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC7EB4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Jan 2003 01:24:21 -0700 (MST)
Date: Thu, 9 Jan 2003 00:29:02 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-ID: <20030109082902.GF23535@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200301090755.h097tadb003653@vilmos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301090755.h097tadb003653@vilmos.org>
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

> The other question. I am using emacs, and I regularly see these messages:
> 
> Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf2 at ip=0x0008937f
> Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf2 at ip=0x0008930b
> 
> What are they?

Blame LaMont!
(yes, I'm just kidding, I've just been waiting for my chance to say
this... :-)

On a more serious note, on parisc load/stores to half-words, words,
doublewords have specific address alignment requirements. the message
usually means the program in question is buggy and is making unaligned
accesses. The unaligned access is trapped and emulated by the kernel, 
so normally the message itself is simply informational.

This is definitely a FAQ.... maybe we should add it to the list :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
