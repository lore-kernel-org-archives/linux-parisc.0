Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FC21482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 16:03:46 -0700 (MST)
Received: from gmx.at ([62.178.92.247]) by viefep12-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20011227230337.QKHP1239.viefep12-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Fri, 28 Dec 2001 00:03:37 +0100
Message-ID: <3C2BA8C4.3C1C2174@gmx.at>
Date: Fri, 28 Dec 2001 00:03:32 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting diskless Linux machine from HP-UX server !
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

Recently I tried to boot a Linux box (in my case it was a i386, but
the problem also exists for a PA-RISC box) from an HP-UX server (model
9000/856, the E55 running 11.00). The problem was, I could not mount
a NFS-Root for the Linux box.

I analysed the problem, and it seems to be a problem with the MOUNT
version (not mixed up with NFS version). Linux uses for normal mounts
MOUNT v3, for NFS ROOT mounts MOUNT v1, which does not include UID and
GID for example. The NFS Server on the HP-UX machine reports in the
log (activated to debug level), that the mount request does not include
UID. So the mount is rejected (EACCES). So I was not able to boot a
linux box using NFS ROOT from an HP-UX server, but I can boot any Linux
box (PA-RISC, i386) from a i386-Linux box.

I hope, you can help here. I think the problem is also interesting for
others, using a HP-UX machine as NFS server instead a Linux machine.

Bye,
Christoph


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
