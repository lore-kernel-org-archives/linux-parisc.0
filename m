Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail8-haw-R.bigfish.com (mail-haw.bigfish.com [12.129.199.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id B789D483E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 08:29:02 -0600 (MDT)
Received: from mail8-haw.bigfish.com (localhost.localdomain [127.0.0.1])
	by mail8-haw-R.bigfish.com (Postfix) with ESMTP id 4549022E5B0
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 14:29:02 +0000 (UCT)
Received: from smtpgw5.sprintspectrum.com (smtpgw5.sprintspectrum.com [207.40.188.13])
	by mail8-haw.bigfish.com (Postfix) with ESMTP id BA6E622E577
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 14:29:01 +0000 (UCT)
Received: from mailhost.sprintspectrum.com (smtpgw8.it.sprintspectrum.com [207.40.65.56])
	by smtpgw5.sprintspectrum.com (8.12.10/8.12.8) with ESMTP id h98ET1B0024939
	for <parisc-linux@lists.parisc-linux.org>; Wed, 8 Oct 2003 09:29:01 -0500 (CDT)
Received: from PDAWG02A.corp.sprint.com (localhost [127.0.0.1])
	by mailhost.sprintspectrum.com (Switch-2.2.8/Switch-2.2.6) with ESMTP id h98ET0213666
	for <parisc-linux@lists.parisc-linux.org>; Wed, 8 Oct 2003 09:29:00 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Date: Wed, 8 Oct 2003 09:28:31 -0500
Message-ID: <1289146742B56546AE580DFC6B711A8313482D@PKDWB07C.ad.sprint.com>
From: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] A3591B (Tachyon) FC Card
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

I am interested in making this card work.  If anyone else is, I would
certainly appreciate some help!  :)

I'm trying to figure out whether it would be a good idea to use some of
the existing code in the cpqfcTS* driver (similar to the way that the
zalon7xx scsi host template calls code in the ncr53c8xx driver).
However, the cpqfcTS* code is quite a beast, perhaps writing the driver
from scratch would be better?  (Googling the list archives shows that
I'm not the only one intimidated(?) by the compaq code :)

I haven't been able to find ANY documentation on this particular card
(not counting the installation manual).  Does anyone else have docs for
this card or the Tachyon(?) chipset it uses??

I guess the icing on the cake is the fact that I don't have ANY
experience writing device drivers.  However, I was able to find an old
article by Alan Cox on how to write a simple scsi driver that has been
very helpful.  I'd appreciate any references to other docs that may be
helpful to a neophyte like myself (specifically, anything that may
explain the parisc-linux specific interfaces register_parisc_driver(),
and the GSC interfaces).

Thank you,

Pat Padgett
