Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 421194830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 13:43:50 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3NJhga13800; Fri, 23 Apr 2004 15:43:42 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404231927.i3NJR33f016630@hiauly1.hia.nrc.ca>
References: <200404231927.i3NJR33f016630@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 23 Apr 2004 15:43:42 -0400
Message-Id: <1082749422.1913.54.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-04-23 at 15:27, John David Anglin wrote:
> I think I know why.  The 64-bit linker only supports a single stub
> table.  Things go bad when a branch can't reach its stub.  I hit this
> when I was trying to implement tail calls.

That's a bit, um, unfortunate, given the current kernel predisposition
for adding a new section for almost every new feature...

How hard would it be to fix this?  Surely all we really need is one stub
table per text section in the final executable (linux still has only
about five executable sections in the vmlinux.lds.S map).

James
