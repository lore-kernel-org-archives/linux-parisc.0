Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688A0488E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Mar 2002 14:39:49 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mLtq-0000Nv-00; Sat, 16 Mar 2002 21:39:38 +0000
Date: Sat, 16 Mar 2002 21:39:38 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card causes kernel BUG
Message-ID: <20020316213938.B2179@parcelfarce.linux.theplanet.co.uk>
References: <3C92DD15.4060008@neuronet.pitt.edu> <raffo@neuronet.pitt.edu> <20020316184231.482C6482C@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020316184231.482C6482C@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Mar 16, 2002 at 11:42:31AM -0700
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

On Sat, Mar 16, 2002 at 11:42:31AM -0700, Grant Grundler wrote:
> works on x86 arch. The right way to access user space data
> is via copy_from_user() or write asm code that explicitly
> references Space Registers (eg sr3).

Let me just explicitly discourage doing this (or, if you must, document
it in Documentation/parisc/registers).  Use of sr3 to access userspace
is subject to change and it'd be nice not to have to check every driver
for use.  It's bad enough that sba & ccio use sr1, but at least we found
those :-)

I cant imagine a good reason for using sr3.  copy_{to,from}_user are
portable and obvious.

-- 
Revolutions do not require corporate support.
