Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66E87482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 11:17:48 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GP65HJ03.6CA for
          <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 09:17:43 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GP65HO00.E0I for <parisc-linux@parisc-linux.org>; Sun, 30 Dec
          2001 09:17:48 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA11450
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 09:14:42 -0900
Date: Sun, 30 Dec 2001 09:14:42 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112300907380.11391-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Tape boot errors and NFS-Root-Howto?
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

So I'm trying to update the firmware on my C180. Have no way to dump the
patch file to CD, but I've got a Debian box with a DAT on it, plus a spare
DAT drive. Install spare in C180, dd the .frm file onto the tape
(remembering to use 'bs=2k' like the doc says), it sees the tape and
refuses to boot, saying 'bad ipl checksum'. Clean tape drives, try a
different tape, try writing it with a different drive, all of which fail.

Decide to pull up the NFS-Root-Howto at Grant's suggestion, just boot the
patch file off the network. Unfortunately, p.e.h.c appears to be down :-(

Questions: Does anyone know if I'm doing the tape creation right? I did
'unshar PF_CC2X0061' (to get the .frm and .text files), then 'dd
if=CC2X0061.frm of=/dev/st1 bs=2k' (which writes 790 records without
error). The unshar says the .frm is compressed data - is this something
that needs further unpacking before writing, perhaps? Also, does anyone
have a local copy of the NFS-Root-Howto that they can point me to? The
only ones I can find are ~1999 and quite out of date...

Thanks!
