Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E392482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Jan 2002 09:28:44 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16VxbG-0003fh-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Jan 2002 17:28:42 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1012408122.3c581f3ab077e@webmail.tiscalinet.be>
Date: Wed, 30 Jan 2002 17:28:42 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] kernel 2.4.17: fs sync broken?
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

As I continue to investigate the problem with evms (last release 0.9.0) and also
as it still crashes, I try to obtain a more complete tool log file (evmsEngine.log).

So I try to remount my fs (/ here) with option sync (in fstab) and chattr +S
/var/log.

On a previous kernel realease (kernel-2.4.16-pa20) it seems to works for me: I
obtain a more complete log and I notice a famous decrease of the system speed.
But now I do not notice anymore this typical decrease of speed and by the way,
it is not anymore possible to obtain any evmsEngine.log (I presume that it is
the inode which is cleaned after the forced fsck requested at the reboot).

Can somebody tell me if it is specific to parisc or to all architectures for
this 2.4.17 kernel (sometime ago I read some discuss about this but do not get
conclusion)?

Thanks in advance for info,
        Joel



-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
