Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (1490223.cipherkey.com [64.114.149.223])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A9634829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 00:48:13 -0700 (MST)
Received: from vilmos.org (my [127.0.0.1])
	by localhost.localdomain (8.12.5/8.12.5) with ESMTP id h0A7d50v010598
	for <parisc-linux@lists.parisc-linux.org>; Thu, 9 Jan 2003 23:39:05 -0800
Received: (from vilmos@localhost)
	by vilmos.org (8.12.5/8.12.5/Submit) id h0A7d5JW010596
	for parisc-linux@lists.parisc-linux.org; Thu, 9 Jan 2003 23:39:05 -0800
Date: Thu, 9 Jan 2003 23:39:05 -0800
From: Vilmos Soti <vilmos@vilmos.org>
Message-Id: <200301100739.h0A7d5JW010596@vilmos.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Printing problem with HP9000 712/80
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

Thanks all of you for the answers. Now at least I know that the unaligned
access message is normal and the harmony is full duplex.

About the printer.

This is a full-blown (not windows only) printer. I tried to connect
it to another Linux box, and I could print a pcl file by catting it to
/dev/lp0. I could also print a text file (/etc/passwd and an ^L at the
end) by sending it to /dev/lp0.

However, when I connect it to the HP9000 712/80 box, then nothing happens
even if I tried to cat the same pcl file to the printer port. I massaged
the connectors to make sure that there is no contact error. This is not
the case since the printer works perfectly on the two other boxes. On
the other hand, I do have an old Panasonic dot matrix printer, and if I
connect that printer to the box, and send a text file with an ^L at the
end, it does print. So now I am in the situation that the HP computer
doesn't talk to the HP printer but to the Panasonic one.

The printer has only one connector which seems proprietary, but the
other end of the end of the cable is parallel.

Thanks, Vilmos
