Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BD404842
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 12:05:44 -0700 (MST)
Received: from p5080C94C.dip.t-dialin.net (p5080C94C.dip.t-dialin.net [80.128.201.76])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id g1PJ5eV14576
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 20:05:41 +0100 (CET)
Date: Mon, 25 Feb 2002 20:05:32 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.43.0202252002560.24957-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] EISA EEPROM patch
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

Hi there,

looks like there is a typo in eisa_eeprom.c. Probably HPEE_BASE_LENG 
should be HPEE_MAX_LENGTH instead?

ebru:/usr/src/linux/drivers/gsc# cvs diff -u eisa_eeprom.c
Index: eisa_eeprom.c
===================================================================
RCS file: /var/cvs/linux/drivers/gsc/eisa_eeprom.c,v
retrieving revision 1.1
diff -u -r1.1 eisa_eeprom.c
--- eisa_eeprom.c       2002/02/24 16:29:43     1.1
+++ eisa_eeprom.c       2002/02/25 19:01:26
@@ -22,10 +22,10 @@
                offset += file->f_pos;
                break;
          case 2:
-               offset += HPEE_BASE_LENG;
+               offset += HPEE_MAX_LENGTH;
                break;
        }
-       return (offset >= 0 && offset < HPEE_BASE_LENG) ? (file->f_pos = offset) : -EINVAL;
+       return (offset >= 0 && offset < HPEE_MAX_LENGTH) ? (file->f_pos = offset) : -EINVAL;
 }

 static ssize_t eisa_eeprom_read(struct file * file,
@@ -35,10 +35,10 @@
        ssize_t ret;
        int i;

-       if (*ppos >= HPEE_BASE_LENG)
+       if (*ppos >= HPEE_MAX_LENGTH)
                return 0;

-       count = *ppos + count < HPEE_BASE_LENG ? count : HPEE_BASE_LENG - *ppos;
+       count = *ppos + count < HPEE_MAX_LENGTH ? count : HPEE_MAX_LENGTH - *ppos;
        tmp = kmalloc(count, GFP_KERNEL);
        if (tmp) {
                for (i = 0; i < count; i++)

Cheers,
--jochen
