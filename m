Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0705F482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 11:03:12 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16QXvR-0001Zv-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 19:03:09 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1011117789.3c446eddddc77@webmail.tiscali.be>
Date: Tue, 15 Jan 2002 19:03:09 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] gpm 1.19.6-9 Broken?
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

I do my daily apt-get dist-upgrade which update my gpm package to release indice
-9 and it failled to start with daemons.log following error messages:

Jan 15 14:00:35 palinux /usr/sbin/gpm[184]: PS/2 mouse failed init
Jan 15 14:00:35 palinux /usr/sbin/gpm[184]: oops() invoked from gpm.c(1019)
Jan 15 14:00:35 palinux /usr/sbin/gpm[184]: mouse initialization failed:
Inappropriate ioctl for device
Jan 15 14:02:10 palinux /usr/sbin/gpm[241]: PS/2 mouse failed init: Unable to
set 1:1 scale.
Jan 15 14:02:10 palinux /usr/sbin/gpm[241]: oops() invoked from gpm.c(1019)
Jan 15 14:02:10 palinux /usr/sbin/gpm[241]: mouse initialization failed:
Resource temporarily unavailable

Same problem with all kernel, so came back to release -5 and it works back

Any idea (it is only hppa problem?) ?

Thanks in advance for help,
        joel


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
