Return-Path: <rscholz@hrzpub.tu-darmstadt.de>
Received: from mailserver1.hrz.tu-darmstadt.de
	(mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8057B488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 04:48:13 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (dialin1.stud.tu-darmstadt.de
	[130.83.60.1])
	by mailserver1.hrz.tu-darmstadt.de (8.12.10/8.12.8) with ESMTP id
	i1MBm3Pk011337 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 12:48:04 +0100
Message-ID: <40389735.2070702@hrzpub.tu-darmstadt.de>
Date: Sun, 22 Feb 2004 12:49:09 +0100
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] Unknown symbol eisa_in8
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

when I configure lastest kernel from cvs to use parport and lp driver as 
module, I get the following warning when running "make modules_install":

WARNING: /lib/modules/2.6.3-pa0/kernel/drivers/char/lp.ko needs unknown 
symbol eisa_in8
WARNING: /lib/modules/2.6.3-pa0/kernel/drivers/char/parport-pc.ko needs 
unknown symbol eisa_in8

Is in both files a definition for io.h missing?

Greetings,   
Ruediger
