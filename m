Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail12.speakeasy.net [216.254.0.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64D7E48AF
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 11:28:39 -0600 (MDT)
Date: Mon, 15 Jul 2002 10:32:33 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <20020715173233.GK8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200207151721.g6FHL72e024968@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200207151721.g6FHL72e024968@hiauly1.hia.nrc.ca>
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

In reference to a message from John David Anglin, dated Jul 15:
> > Is --disable-indexing used in kernel builds?  This should stop gcc
> > from generating the above.
> 
> Oops, that should be "-mdisable-indexing".

right now we use:
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
-fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs
-ffunction-sections -march=2.0 -mschedule=8000

(the last two are only for pa8x00 builds...)

i'll try the disable-indexing stuff...

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
