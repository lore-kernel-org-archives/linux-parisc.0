Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 188EF483D
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 06:46:15 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3NCk7a21331; Fri, 23 Apr 2004 08:46:07 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404222313.i3MNDv9d017627@hiauly1.hia.nrc.ca>
References: <200404222313.i3MNDv9d017627@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 23 Apr 2004 08:46:07 -0400
Message-Id: <1082724367.1913.2.camel@mulgrave>
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

On Thu, 2004-04-22 at 19:13, John David Anglin wrote:
> Looking at a couple ok 64-bit kernels, I'm surprised that stubs are
> needed for "b,l x,%rp".  It suggests that these branches are getting
> treated as 17-bit branches instead of 22-bit branches.  Of course,
> "b" is limited to 17-bit displacements and it could easily need
> a stub.

Apparently, they are.  If you objdump the .o files, you see they're of
type R_PARISC_PCREL17F

> Which tool chain?

A fairly recent one:

2.14.90.0.7 20031029 Debian

James
