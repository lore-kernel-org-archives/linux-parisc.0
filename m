Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A17AF48D4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 20:05:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16jXAe-000352-00; Sat, 09 Mar 2002 03:05:20 +0000
Date: Sat, 9 Mar 2002 03:05:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: Duraid Madina <duraid@fl.net.au>
Cc: 'Randolph Chung' <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Swap space limitions for Linux on parisc
Message-ID: <20020309030520.A26217@parcelfarce.linux.theplanet.co.uk>
References: <20020309024516.GC22385@tausq.org> <000301c1c716$94030b80$022a17ac@simplex>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000301c1c716$94030b80$022a17ac@simplex>; from duraid@fl.net.au on Sat, Mar 09, 2002 at 02:00:31PM +1100
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

On Sat, Mar 09, 2002 at 02:00:31PM +1100, Duraid Madina wrote:
> A computational physics code. Ideally I would run it in 100s of GB of
> RAM. About two months of pain went into making it work (reasonably
> efficiently, in theory at least) in 100s of GB of swap.

Hmm.  You would probably be best off making it work by mmaping chunks
of a data file at a time.

> Now you have *me* curious; I don't mean to be an ignorant asshole, but
> what's the point of hppa64 if you *don't* support >4G address space?

Supporting >4GB of physical ram, which can be shared among multiple
processes, each being <4GB in size :-)

> *crying* does HP-UX support >4G address space? *finds wallet* :(
> Hmm, probably have to shell out more $$$ for the HP compilers too :\

gcc works fine on hpux...

-- 
Revolutions do not require corporate support.
