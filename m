Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2244A482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 01:30:59 -0600 (MDT)
Date: Wed, 23 Oct 2002 09:30:19 +0200
Message-ID: <3DB5776100000362@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
To: dreamind@dreamind.de
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] mkfs.xfs (xfsprogs-2.3.5) failled
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

Hi Stephan,

As you do earlier, I build a xfs-kernel diff versus 2.4.19 vanilla kernel,
apply it against 2.4.19-pa22 (with very small problem) and obtain a bootable
(and operational) kernel.

Now I rebuild debian package of xfsprogs-2.3.5 (cvs form) and obtain tools
binaries (without warning or error) but even mkfs -t xfs (mkfs.xfs) failed
with this concise message: "mkfs.xfs: cannot reserve space [28 - No space
left on device]".
(I try to xfs_check which failed also with a lot of error messages).

As you already do portage effort may be have you some idea of some starting
point of investigation?

Thanks in advance for all,
    Joel
