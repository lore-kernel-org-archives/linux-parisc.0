Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13BDC484A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Jul 2002 11:57:18 -0600 (MDT)
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Subject: Re: [parisc-linux] Kernel panic, ccio-dma.c, C110
Message-ID: <1026928635.3d35affb24e7e@webmail.tiscalinet.be>
Date: Wed, 17 Jul 2002 19:57:15 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
References: <3D35925D.71683E92@ruhr-west.de>
In-Reply-To: <3D35925D.71683E92@ruhr-west.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Juergen Braukmann <juergen.braukmann@ruhr-west.de>:


> All I need to do to crash the machine is writing big files (i.e. kernel
> tarballs) to the drive (either copying or from ftp). What makes me
> wonder is that I was able to copy some 300 MB *.wav file to it some
> weeks back.
> 
Do you also check scsi terminator (palinux is more sensible than hpux)?

What says dd if=/dev/sdi of=/dev/null

If you have an hp diagnostics CD boot with it to analyse your disk?

Joel




-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
