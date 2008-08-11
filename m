From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Mon, 11 Aug 2008 12:56:43 -0400 (EDT)
Message-ID: <20080811165644.B18F04DE6@hiauly1.hia.nrc.ca>
References: <20080811155158.GA21292@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, kyle@mcmartin.ca, matthew@wil.cx,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, bdale@hp.com
To: bunk@kernel.org (Adrian Bunk)
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756145AbYHKQ46@vger.kernel.org>
In-Reply-To: <20080811155158.GA21292@cs181140183.pp.htv.fi> from "Adrian Bunk" at Aug 11, 2008 06:51:58 pm
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The toplevel COPYING file of the kernel sources contains the exact 
> licence text for all files (including binfmt_som.c) in the kernel.

The COPYING file contains the license text but it doesn't say clearly
what the license applies to.  The closest thing to this is the statement

   Also note that the GPL below is copyrighted by the Free Software
   Foundation, but the instance of code that it refers to (the Linux
   kernel) is copyrighted by me and others who actually wrote it.

in the COPYING file.  The applicability of the GPL is parenthetical.
The HOWTO file is more specific, but a clear license statement at the
top level of the "source" tree is missing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
