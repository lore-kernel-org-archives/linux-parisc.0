Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6A674829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 07:22:23 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17wjSG-0006kJ-00; Wed, 02 Oct 2002 14:22:20 +0100
Date: Wed, 2 Oct 2002 14:22:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc and ++
Message-ID: <20021002142220.B18377@parcelfarce.linux.theplanet.co.uk>
References: <20021002034059.34434.qmail@web12505.mail.yahoo.com> <3D9A94D3.8010009@itp.bg> <3D9AA07A.4B994F44@hpfrcu81.france.hp.com> <20021002132411.Z18377@parcelfarce.linux.theplanet.co.uk> <3D9AEE2C.823AE9BD@hpfrcu81.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D9AEE2C.823AE9BD@hpfrcu81.france.hp.com>; from phi@hpfrcu81.france.hp.com on Wed, Oct 02, 2002 at 03:01:32PM +0200
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

On Wed, Oct 02, 2002 at 03:01:32PM +0200, phi wrote:
> Wouldn't be 'natural' to declare ++ a sequence point as well as comma is since
> it has side effects, beside it would remove the sequence-point jazz in the
> warning emits.

*boggle*.  i suggest you get hold of a copy of the C spec or a good
book on the C programming language.  What you are doing is _explictly_
undefined by the specification.  The compiler is free to emit
whatever code it likes.  GCC doesn't warn for the fun of it, you know.
http://www.eskimo.com/~scs/C-faq/q3.1.html gives some more detail.

> Right now the macro look like this for flawed/featured gcc.
> 
> #define get3_4(p) ({register uint32
> t=(*p++)<<24;t+=(*p++)<<16,t+=(*p++)<<8,t+(*p++);})

i thought you were trying to write portable code; the ({ ... }) is a
gcc extension.

-- 
Revolutions do not require corporate support.
