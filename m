Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 516954829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 10:52:32 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscalinet)
	id 182Dsq-00076r-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 18:52:28 +0200
Date: Thu, 17 Oct 2002 19:48:42 +0200
Message-ID: <3DA56CAE00002AEB@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=========3DA56CAE00002AEB/mail.tiscali.be"
Subject: [parisc-linux] FW: [Bug #3332] jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
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

--=========3DA56CAE00002AEB/mail.tiscali.be
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi all,

May be much hppa specific problem.

All advise is well come.

Thanks in advance,
    Joel


--=========3DA56CAE00002AEB/mail.tiscali.be
Content-Type: message/rfc822
Content-Disposition: inline

Return-Path: <oss@www-124.ibm.com>
Original-Recipient: rfc822;joel.soete@tiscali.be
Received: from www-124.ibm.com (129.33.28.104) by mail.tiscali.be (6.0.053)
        id 3DAAAD3F00102627 for jsoe0708@tiscali.be; Thu, 17 Oct 2002 18:47:31 +0200
Received: (from oss@localhost)
	by www-124.ibm.com (8.11.6/8.11.0) id g9HGlU125191;
	Thu, 17 Oct 2002 12:47:30 -0400
Date: Thu, 17 Oct 2002 12:47:30 -0400
Message-Id: <200210171647.g9HGlU125191@www-124.ibm.com>
To: joel.soete@tiscali.be
Subject: [Bug #3332] jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22
From: admin@www-124.southbury.usf.ibm.com

Bug #3332 has been submitted pending email address confirmation. 
Here is a current snapshot of the bug.

Project: 
Category: kernel
Status: Open
Bug Group: bug
Priority: 5
Summary: jfs-1.0.22 and 1.0.23 break fb console on k-2.4.19-pa22

Details: Hi all,

Test your tools, I test early with success 1.0.17 (against k-2.4.18-pa54 and latter).

Today, after spending some time to fix some evms tools problems, I update jfs against last k-2.4.19-pa20 (and latter) with release 1.0.22 and next 1.0.23.

I build successfully a jfs on a evms lvm, populate it, fsck all seems ok.

Just an anoying problem the fb console is broken:
just when kernel launches to detect the first scsi device the screen scroll stop and the rest of messages are all display over others on  the very top line of the screen.

Thanks in advance for help,
    Joel

Thank you for submitting your bug. To have your bug published, visit the following url:

http://www-124.ibm.com/developerworks/bugs/verify.php?confirm_hash=9001bfa38f3e1a4b

 -- the IBM OSS staff



--=========3DA56CAE00002AEB/mail.tiscali.be--
