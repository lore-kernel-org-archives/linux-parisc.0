Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEAED4867
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 07:52:04 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3NDpua25034; Fri, 23 Apr 2004 09:51:56 -0400
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
From: James Bottomley <James.Bottomley@steeleye.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200404231340.i3NDejFp003662@hiauly1.hia.nrc.ca>
References: <200404231340.i3NDejFp003662@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 23 Apr 2004 09:51:56 -0400
Message-Id: <1082728316.2017.18.camel@mulgrave>
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

On Fri, 2004-04-23 at 09:40, John David Anglin wrote:
> If you look at the .level directive in the assembler output for one of
> these files, do you see "2.0w".  The branches should also appear as "b,l"
> instead of the PA 1.x "bl".  This should tell us whether this is a gcc
> or assembler problem.

The file causing the problems is entry.S, so it's an assembler file, not
a gcc file.

It has a .level 2.0w (with the appropriate #ifdefs) at the top.

Now, if you look at an objdump of the .o, it shows:

000000000000205c <syscall_do_resched>:
    205c:	e8 40 00 00 	b,l 2064 <syscall_do_resched+0x8>,rp
			205c: R_PARISC_PCREL17F	schedule
    2060:	37 dd 3f e1 	ldo -10(sp),ret1
    2064:	e8 1f 1b ed 	b,l 1e60 <syscall_check_bh>,r0
    2068:	08 00 02 40 	nop

I suppose this means gas thinks it has to emit short relocations.

You have access to what I'm seeing; my kernel build environment is on
gsyprf11:~jejb/cvsnode/linux-2.6

James
