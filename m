Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (p003.sw02.auto.usertools.net [202.154.81.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2200D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 06:45:21 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id VAA26958
	for parisc-linux@lists.parisc-linux.org; Sun, 12 Jan 2003 21:44:59 +0800
Date: Sun, 12 Jan 2003 21:44:55 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] upgrading kernel
Message-ID: <20030112214452.B25226@neep.com.au>
References: <20030112073656.GB13397@piglet2> <20030112073506.GB1177@tausq.org> <20030112110219.GC13397@piglet2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030112110219.GC13397@piglet2>; from plaven@bigpond.net.au on Sun, Jan 12, 2003 at 10:02:19PM +1100
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

Peter Lavender said:
> Thanks... this outlines what to do with a custom kernel.. I was
> thinking there might be a debian way... like with kernel-packages (I
> just reading up about it now for my i386 based system).

You can build your new kernel the Debian way with make-kpkg - the
kernel-package system is available for the hppa architecture.  I don't
know if it works yet in all of Debian's architectures (ie knows how to
configure all the boot loaders) but I think it knows about PALO so hppa
should be fine.

> The kernel on the 715/64 is from last year sometime ago... I can get
> the kernel version with uname becuase it seg faults.

You might be able to find out with 'file /vmlinux' ... or 'dmesg|head'
or 'head /var/log/dmesg' ...

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
