Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA7754829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 10:19:11 -0700 (MST)
Date: Tue, 26 Nov 2002 09:22:13 -0800
From: Randolph Chung <tausq@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021126172213.GI19331@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20021126162938.GX21187@tausq.org> <3DAAAD4600004A6B@ocpmta1.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DAAAD4600004A6B@ocpmta1.be.tiscali.com>
Subject: [parisc-linux] Re: uaccess ya patch
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

> It was much more to mentionned that in asm extension of gcc for hppa it exists
> also a way to address the second word (what I tried to find for a long) of
> a long long via the 'R' prefix as here in '%R2' [is it what you want to say
> 'will cause bad things'?]

maybe you are thinking of floating point registers? %r2 is general
register number 2, i.e. the return pointer.  it is not what you want to
store into memory.

> (the macro was just beacuse the original __put_?_asm() was macro :) )

well, it was an inline function for a reason -- to avoid nasty casts.
the macro as you've defined it will probably cause a lot of warnings.

randolph
