Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail2.scram.de (mail2.scram.de [195.226.127.112])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C0204829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 12:12:11 -0700 (MST)
Date: Thu, 23 Jan 2003 20:11:50 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] floppy images
In-Reply-To: <20030123172718.GB22325@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0301232009350.28006-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Grant,

> I don't know about 720 - glad someone else said it did.

model 9000/720
Total Memory: 32 Mb
[...]
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: TEAC      Model: FC-1     HF   07  Rev: RV A
  Type:   Direct-Access                      ANSI SCSI revision: 01 CCS
  Vendor: IBM       Model: DCAS-34330        Rev: S61A
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi removable disk sda at scsi0, channel 0, id 3, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0

sda is the floppy, sdb the hard drive.

Thanks,
--jochen
