Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8D764880
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 10:49:24 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17T3bf-0008Op-00
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 18:49:23 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <1026492563.3d2f08930c978@webmail.tiscalinet.be>
Date: Fri, 12 Jul 2002 18:49:23 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] MD problem
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

Hi All,

I build a raid-1 configuration starting from the internal disk sdb formated as
follow:
                                  cfdisk 2.11n

                              Disk Drive: /dev/sdb
                             Size: 9100044288 bytes
              Heads: 64   Sectors per Track: 32   Cylinders: 8678

    Name        Flags      Part Type  FS Type          [Label]        Size (MB)
 ------------------------------------------------------------------------------
    sdb1                    Primary   Linux/PA-RISC boot                  63.97
    sdb2                    Primary   Linux swap                         128.98
    sdb3                    Primary   Linux                              127.93
    sdb5                    Logical   Linux                             1664.10
    sdb6                    Logical   Linux                              255.86
    sdb7                    Logical   Linux                              127.93
    sdb8                    Logical   Linux                              127.93
    sdb9                    Logical   Linux                             2047.87
    sdb10                   Logical   Linux                             2047.87
    sdb11                   Logical   Linux                             2047.87
                            Logical   Free Space                         459.28

sdb3 being the /boot & sdb5 / fs.

then I copy this structure with sfdisk -d /dev/sdb | sfdisk /dev/sda (same size
but not the same supplier) and synchronize all mdi with respective disk slice.

All is ok. But still have to mirror manually quasi static slices: sdx1 (F0) and
sdx3 (/boot). So I umount /boot and made a dd from sdb3 to sda3 Ok and sdb1 to
sda1 Ok.

But when I try to boot from the mirror (ie sda) bootloader did not find the ipl
eventhought the copy of the two F0 slices (I can still boot from sdb)?

What do I wrong or better what should I have to resolve this problem?

Thanks in advance for advice,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
