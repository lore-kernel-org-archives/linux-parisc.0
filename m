Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.libero.it (smtp1.libero.it [193.70.192.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id A73064841
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Oct 2003 02:32:08 -0600 (MDT)
Received: from [192.168.1.10] (151.42.169.63) by smtp1.libero.it (7.0.020-DD01)
        id 3F6F0E4800A25B7E for parisc-linux@lists.parisc-linux.org; Wed, 22 Oct 2003 10:32:37 +0200
Date: Wed, 22 Oct 2003 10:30:55 +0200
From: Riccardo Mottola <zuse@libero.it>
To: parisc <parisc-linux@lists.parisc-linux.org>
Message-ID: <BBBC0CDE.9A52%zuse@libero.it>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] SCSI problems
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

Hello,

    I know it is impolite to ask again if you don't get an answer but... I
want to know more about my scsi problems I get on my 720.

    To sum up the situation: If  I install Debian or Gentoo on a IBM 2GB
disk the kernel will freeze when I make a new ext2 or ext3 fs. If under
gentoo I select reiser FS, the kernel will freeze during the untarring of
the distribution. Since I get absolutely no errors but just a freeze it is
difficult to know anything further (even if it is really a SCSI problem,
since I get no kernel panic, but it seems obvious to me following the
repeatable situation). I'm using serial console.
    The disk is ok, I used it on a mac, tested it low-level and formatted it
with mediainit from hp-ux. The strange thing is that on a smaller 1GB disk I
had no problems (but 1gb is too small for gentoo so I never finished the
install).

One question I have, the kernel says it usees the LASI driver. But the hp
720 "cobra" has no LASI chip, but the ASP chip using the NCR 53C700
controller. Are they compatible?

Any suggestions?

-Ric
