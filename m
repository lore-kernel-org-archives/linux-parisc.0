Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0169448CC
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 20:00:33 -0700 (MST)
From: "Duraid Madina" <duraid@fl.net.au>
To: "'Randolph Chung'" <randolph@tausq.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Swap space limitions for Linux on parisc
Date: Sat, 9 Mar 2002 14:00:31 +1100
Message-ID: <000301c1c716$94030b80$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20020309024516.GC22385@tausq.org>
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

> > The 'yet' above gives me hope; will 64 bit user space processes be 
> > supported anytime soon? Being able to malloc(1<<36) would be nice!
> 
> I sure hope not.... there is a lot of work involved to bring 
> up toolchains and all the applications to support two 
> different userlands. We still have a lot of work to do just 
> to stablize 32-bit userspace. Check the list archives, this 
> has been discussed before, and once fairly recently.

I had a bit of a peek around the archives, wow, I guess hppa64 isn't the
most 'comfortable' place for a g++ developer just now.

> This is not to say it couldn't be done of course. This is 
> GNU/Linux, you have all the source, go nuts.. :-)

Project deadline soon :( must.. find.. cheap.. 64 bit machine
 
> But now you have me curious, what app are you writing that 
> needs >4G of address space?

A computational physics code. Ideally I would run it in 100s of GB of
RAM. About two months of pain went into making it work (reasonably
efficiently, in theory at least) in 100s of GB of swap.

Now you have *me* curious; I don't mean to be an ignorant asshole, but
what's the point of hppa64 if you *don't* support >4G address space?

*crying* does HP-UX support >4G address space? *finds wallet* :(
Hmm, probably have to shell out more $$$ for the HP compilers too :\

	Duraid
