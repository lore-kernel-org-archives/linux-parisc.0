Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DC2D4DAE
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Apr 2004 16:54:41 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3MMsYa15679; Thu, 22 Apr 2004 18:54:34 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404222250.i3MMoUOq017459@hiauly1.hia.nrc.ca>
References: <200404222250.i3MMoUOq017459@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 22 Apr 2004 18:54:34 -0400
Message-Id: <1082674474.2860.127.camel@mulgrave>
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

On Thu, 2004-04-22 at 18:50, John David Anglin wrote:
> If schedule is too far away, the linker will add a long branch stub.
> This apparently doesn't work in the kernel.  On the otherhand, `b,l'
> should go about 8 MB without needing a stub.

Well, but it does ... we have other jumps that seem to be correctly
stubbed.

> Disassemble 101369b8 and see if it's a linker stub.

I did; it's genuinely in the middle of the dbl_to_sgl_fcnvxf; no sign of
any stub code anywhere close.

James
