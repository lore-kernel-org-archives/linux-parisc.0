Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id C252B482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Dec 2001 05:27:15 -0700 (MST)
Message-ID: <3C1C93FB.8AE6C6E3@freebel.net>
Date: Sun, 16 Dec 2001 12:30:51 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: maneesh@india.hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation
Content-Type: text/plain; charset=us-ascii
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

Hello Maneesh,

>        selection .. Bus reset detected ..." etc. etc.

This sound like a problem I met a time ago: the scsi chain was opened
(ie during test I forgot to reconnect the scsi terminator to my external
drive).

If a scsi terminator is well connected may be could it be defective (or
a one not corresponding to your scsi interface logicaly Single-Ended if
your CD is connected to the narrow single-ended conector)?

Good luck,
	Joel
