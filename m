Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.kabelleipzig.de (unknown [80.146.194.2])
	by dsl2.external.hp.com (Postfix) with SMTP id 05E28482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  7 Jul 2002 00:04:07 -0600 (MDT)
Received: from kabelleipzig.de (10.50.33.20)
          by mail.kabelleipzig.de with MERCUR-SMTP/POP3/IMAP4-Server (v3.30.09 AS-000000008)
          for <parisc-linux@lists.parisc-linux.org>; Sun, 7 Jul 2002  08:04:05 +0200
Message-ID: <3D27D979.8050100@kabelleipzig.de>
Date: Sun, 07 Jul 2002 08:02:33 +0200
From: sven schnelle <schnelle@kabelleipzig.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] kdb include files
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


hello,

Im writing on a floppy driver for my 712 and want to use kdb,

but when i try to compile the kernel with it, i get errors:

kdb/break.h: No such file or directory
kdb/kgdb_types.h: No such file or directory
kdb/kgdb_machine.h: No such file or directory
kdb/trap.h: No such file or directory

does anybody know where i can get this files ?.

bye
     sven
