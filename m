Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3ED66482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 08:51:48 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16uaUk-0000Wc-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 08 Apr 2002 16:51:46 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1018277506.3cb1ae82d2cca@webmail.tiscali.be>
Date: Mon, 08 Apr 2002 16:51:46 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Linux palinux 2.4.19-pre5-pa0 #2 Mon Apr 8 15:16:06 CEST 2002 parisc unknown
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

It seems to works just still have a problem with modules:

mkdir -p pcmcia; \
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.19-pre5-pa0; fi
depmod: *** Unresolved symbols in
/lib/modules/2.4.19-pre5-pa0/kernel/drivers/scsi/scsi_debug.o
depmod: 	vmalloc
make: *** [_modinst_post] Error 1
Mon Apr  8 16:04:06 CEST 2002

Any idea?

Joel

PS: The full compressed patch is about 4Mb so I could not join to this mail :(
if any ineterest let me know where can I upload.

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
