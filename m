Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7747E4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Nov 2002 18:21:34 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18B3Gb-0000lu-00; Mon, 11 Nov 2002 01:21:29 +0000
Date: Mon, 11 Nov 2002 01:21:29 +0000
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>, Jeff Bailey <jbailey@nisa.net>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111012129.A29998@parcelfarce.linux.theplanet.co.uk>
References: <20021111010517.GA13575@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021111010517.GA13575@systemhalted>; from carlos@baldric.uwo.ca on Sun, Nov 10, 2002 at 08:05:17PM -0500
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

On Sun, Nov 10, 2002 at 08:05:17PM -0500, Carlos O'Donell wrote:
> Lastly, I think that the fp* tests suffer from the printf bug?

Last I looked, we suffered from the fact that glibc thinks `long double'
is 96 bits, gcc thinks `long double' is 64 bits and gcc-hpux thinks that
`long double' is 128 bits.  I've been whining about this for over a year
and nothing's happened.  I think it's fairly clear that not much uses
long double, otherwise we'd've noticed more failure cases.  So changing
both gcc & glibc to a 128-bit long double is the Right Thing to do and
we can just suck up this ABI breakage.

In case anyone's wondering, the architecture specifies 32-bit, 64-bit and
128-bit floating point registers as being available.  My understanding is
that no processor has actually implemented the 128-bit floating point ops
(except maybe load and store) and they always trap to the FP emulation
code (which we copied from HPUX).

-- 
Revolutions do not require corporate support.
