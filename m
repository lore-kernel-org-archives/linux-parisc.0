Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E17C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Dec 2001 02:41:35 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16Gzhg-0008Uq-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Dec 2001 10:41:28 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1008841288.3c21b2487cc61@webmail.tiscalinet.be>
Date: Thu, 20 Dec 2001 10:41:28 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Problem with 2.4.16-pa20 fb and  Xfree86
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

Is some one else met the same problem:
I boot with kernel 2.4.9-32 (Debian pool) and use Xfce and all works kindly.
I cvs update the kernel 2.4.16-pa20 recompile it, install it, reboot it and
launch Xfce which start well excepted that all is black but the border of a
xterm (in which caracters are fortunately white); when I click in the background
I have well access to the menu?

Is something is broken in fb in 2.4.16? (sorry I do not have enought time to
test X after each cvs update to notice exactely when this problem appears)

Thanks in advance for all advises,
        Joel

PS: I use a b180L on which I do an apt-get dist-upgrade yesterday (Dec 19, 2001).

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
