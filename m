Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75DBB4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 04:01:49 -0600 (MDT)
Date: Tue, 15 Oct 2002 12:58:10 +0200
Message-ID: <3DA56CAE000017FC@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] XFS cvs (KERNEL_KDB conflict)
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

Hi all,

I am on going to test lastest XFS CVS (dpkg release 1.0.2 do not foreseen
k-2.4.19) against k-2.4.19-pa22 and encouter a conflict in linux/include/linux/sysctl.h:

line 128 KERN_HPPA_PWRSW=55,
         KERN_HPPA_UNALIGNED=56,

which conflict with
         KERN_KDB=55,

Right now I do not need KDB but it should be interresting to fix this;-)

Regards,
    Joel
