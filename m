Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A6254830
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 11:09:47 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3NH9da04289; Fri, 23 Apr 2004 13:09:39 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404231657.i3NGvBAP004762@hiauly1.hia.nrc.ca>
References: <200404231657.i3NGvBAP004762@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 23 Apr 2004 13:09:39 -0400
Message-Id: <1082740179.2017.45.camel@mulgrave>
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

On Fri, 2004-04-23 at 12:57, John David Anglin wrote:
> The .level 2.0w should come before any actual assembly code.  If the
> includes define any assembly code this could be a problem.  The assembler
> isn't very smart about changing levels.

Well, yes, there were (just macros, though).  However, I moved the level
setting right to the top of the file and it made no difference.

> Yes.  The code is using "bl".  It looks as if the assembler is
> generating a 17-bit branch (sub-opcode 0) when it sees a "bl"
> even when generating PA 2.0w code.  This would appear to be
> wrong although I haven't checked what the HP assembler does.
> Can you use "b,l" for PA 2.0 code?

Well, the 2.0 manual implies b,l can be used whether the execution is in
wide or narrow mode, so yes, it should apply to all 2.0 code.

James
