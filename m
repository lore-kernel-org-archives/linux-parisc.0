Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC302482A
	for <parisc-linux@parisc-linux.org>; Wed, 12 Feb 2003 16:14:00 -0700 (MST)
Date: Wed, 12 Feb 2003 13:52:38 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] local symbols appearing in objdump/nm output
Message-ID: <20030212215238.GX11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030212171735.W5992@parcelfarce.linux.theplanet.co.uk> <200302122250.h1CMoVCw029031@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302122250.h1CMoVCw029031@hiauly1.hia.nrc.ca>
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

> This would appear to be a problem with the specific toolset (gas)
> that you are using.  For example, there are no .L[0-9] labels in
> the .o files of my gcc builds, but I see them in traps.o, for
> example.  In this case, traps.o was built with the 64-bit toolset
> (probably, debian).

yup, i don't see this when building kernels with the latest toolchain.
willy is building with older cross-toolchain, so it's probably just a
matter of producing some more up to date tools and putting up on
parisc-linux.org ...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
