Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla3.xs4all.nl (smtpzilla3.xs4all.nl [194.109.127.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AE55482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Nov 2001 23:08:07 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla3.xs4all.nl (8.12.0/8.12.0) with ESMTP id fA5685Tm021800
	for <parisc-linux@lists.parisc-linux.org>; Mon, 5 Nov 2001 07:08:05 +0100 (CET)
Date: Mon, 5 Nov 2001 07:01:16 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: More Install on C110: Kernel doesn't load...
Message-ID: <20011105070116.A2209@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <200111022221.PAA07613@puffin.external.hp.com> <BC52B862-D198-11D5-80EF-0030657D1C94@bigw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <BC52B862-D198-11D5-80EF-0030657D1C94@bigw.org>
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

On Sun, Nov 04, 2001 at 08:56:40PM -0600, Daniel Williams wrote:
> OK, burned the straight download ISO the way that works with EasyCD 
> Creator, but it still gives me the same message as last time, in the 
> same place as last time.
> 
> <snip of seg 0-3 loads>
> Error: read from boot device failed( status = -4)
> byteio_read: seekread() returned -1 expected 2048
> error:  segment 0 read() failed
> 
> The CD was burned at 2x and the discs are 4x certified (PNY).  The CD is 
> external on the 50 pin narrow bus (core.SCSI.2.0)  However, it does not 
> have termination on the external bus.  The internal narrow SCSI devices 
> *do* have termination (ie the DDS2 tape drive).  I have switched the CD 
> with the DDS2 drive before, but not this time with the new correct 
> burn.  Could termination be an issue here and should I try putting the 
> CD drive internally with termination?

If your external chain is unterminated, then yes, termination could be
an issue. It's not certain, but it's certainly easier to try than
testing another CDROM, right?

Good luck,
Jurriaan
-- 
Put it this way, when people slip in what dogs have left in the streets,
they do tend to say, 'Oops, I've trod in an Edmund'.
	Blackadder II
GNU/Linux 2.4.13-ac6 on Debian/Alpha 64-bits 990 bogomips load:0.06 0.04 0.03
