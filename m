Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla1.xs4all.nl (smtpzilla1.xs4all.nl [194.109.127.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45371482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 23:08:08 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla1.xs4all.nl (8.12.0/8.12.0) with ESMTP id fAC6856f012779
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 07:08:06 +0100 (CET)
Date: Mon, 12 Nov 2001 07:03:06 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: "Craig D. Lansing (root)" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost There...
Message-ID: <20011112070306.B14600@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <3BEF3746.FB93DC1@beldar.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BEF3746.FB93DC1@beldar.com>
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

On Sun, Nov 11, 2001 at 09:43:18PM -0500, Craig D. Lansing (root) wrote:
> After using my CD burner to create several nice coasters, I have been
> able to create a couple of CD's from which my J2240 will attempt to
> boot.  I think that I am almost there, but need someone to show me the
> error of my ways.  Disclaimer: I am not a System Admin by trade.  I have
> been an HP-UX user since about version 7, but have not had a box of my
> own to play with until I pulled this J2240 from the trash.  The system
> is a J2240 2-way, 2.5GB RAM, 2x8GB internal FW-SCSI Disks, DDS-III,
> internal Toshiba SCSI CD-ROM, 21" graphics console.

We know the story. Now don't mention it again, because we'll go green
with envy and look elsewhere :-)

> Command Line: 'root=/dev/ram console=tty0 sti=0 sti_font=VGA8x16
> TERM=linux'
> 
Shouldn't that be ttyS0 for the console?

Good luck,
Jurriaan
-- 
Go not unto the Usenet for advice, for you will be told both yea and nay (and
quite a few things that just have nothing at all to do with the question).
	seen in a .sig somewhere
GNU/Linux 2.4.13-ac8 on Debian/Alpha 64-bits 990 bogomips load:1.33 1.47 1.20
