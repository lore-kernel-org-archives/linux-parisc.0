Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D4FD4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Feb 2003 18:04:02 -0700 (MST)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20030208010400.SUQE20385.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 8 Feb 2003 02:04:00 +0100
Message-ID: <3E44577F.5060509@gmx.at>
Date: Sat, 08 Feb 2003 02:03:59 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Status SCSI/MUX on E55 (and family)
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

Hallo PARISC Hackers !

Is there any new status on MUX or SCSI on E55 or similar ?


Further experiments with MUX:
----------------------------

Any write access to a MUX port > 0, then the machine
hangs up. I need the source code !!!!!!!
                      ===========

My new idea is, that the PDC activates port 0 via the unused
offset for giving commands. I cannot continue without HP-UX
source code or other code pieces.

Another point - a bug in the tty layer ?

If I write a string to the ttyB1 or read from it (cat < /dev/ttyB1)
then a byte 0xe0 is sent to the mux driver via mux_write ().
I could not detect, where it come from !! Any idea ?

With friendly regards
Christoph




-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
