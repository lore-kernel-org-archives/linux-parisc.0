Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ocs.com.au (ppp0.ocs.com.au [203.34.97.3])
	by dsl2.external.hp.com (Postfix) with SMTP id 41234482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 07:00:09 -0600 (MDT)
From: Keith Owens <kaos@ocs.com.au>
To: sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 23:00:03 +1000
Message-ID: <2105.993214803@ocs3.ocs-net>
Subject: [parisc-linux] SCSI in arch/{m68k,parisc,sparc*}/config.in
List-ID: <linux-parisc.vger.kernel.org>

cc: kaos@ocs.com.au please, I am not on these lists.

arch/{m68k,parisc,sparc*}/config.in have their own SCSI list instead of
using drivers/scsi/Config.in.  Cleaning up the SCSI config file is on
my 2.5 TODO list, can you tell me why these architectures have their
own list of SCSI devices?

If it is because only some SCSI drivers work on these architectures, do
you really need to be this specific?  Other architectures source
drivers/scsi/Config.in without checking for arch dependent drivers.  If
the need is to support extra arch specific drivers, use the same
technique as acorn :-

# drivers/scsi/Config.in
if [ "$CONFIG_ARCH_ACORN" = "y" ]; then
   source drivers/acorn/scsi/Config.in
fi

ps. There is no entry for parisc in MAINTAINERS.
