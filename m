Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CDBA4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Mar 2001 10:57:16 -0700 (MST)
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] INLINE_SYSCALL/gcc-bug? (Was Re: pipes) 
In-Reply-To: Your message of "Wed, 07 Mar 2001 10:39:35 MST."
             <E14ahuS-0001t2-00@noam.fc.hp.com>
References: <20010223113052.G4660@linuxcare.com> <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au> <20010223212325.K4660@linuxcare.com> <20010226175701.U4660@linuxcare.com>  <E14ahuS-0001t2-00@noam.fc.hp.com> 
Date: Wed, 07 Mar 2001 10:57:12 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14aiBV-0004BG-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Minor mistake on my part -- my example wasn't compiled with the latest
compiler but the defect seems stable across several recent compiler
versions (xc-20010305 doesn't appear to be able to compile glob*.c
and others in glibc).

	-P
