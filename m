Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A9784A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 11:49:36 -0700 (MST)
Reply-To: <hull@cup.hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: "Matthew Wilcox" <matthew@wil.cx>, <arjanv@redhat.com>
Cc: <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Prefetch macros for PA-RISC
Date: Wed, 21 Feb 2001 10:49:33 -0800
Message-ID: <NDBBIHNACACKNDHNHIKAIEEGCBAA.jim_hull@hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20010221111141.H31164@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

Matthew, you wrote:

> on PA, we have prefetch for read and prefetch for write.  They're encoded
> as loads to the 0 register.  prefetch read is ldd (load 64-bit quantity)
> and prefetch-write is ldw (load 32-bit quantity).

Actually, Table 6-10 in the PA-RISC 2.0 book is wrong -- LDW is prefetch
for read, LDD is prefetch for write.  See this erratum description:

http://devresource.hp.com/devresource/Docs/Refs/PA2_0/updates/e1.html

 -- Jim
