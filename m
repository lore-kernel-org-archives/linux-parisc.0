Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA23089
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 14:46:31 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id E304E164B
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 13:48:11 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id NAA27189
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 13:53:05 -0800 (PST)
Message-Id: <200010312153.NAA27189@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] unable to run palo on nfs root 
In-reply-to: Your message of "Tue, 31 Oct 2000 12:58:41 PST."
             <5.0.0.25.0.20001031125250.00ad6430@mail.webcash.com>
Date: Tue, 31 Oct 2000 13:53:04 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kailashnath V Rampure wrote:
> fisrt partition is 10M of type f0
> second partition is /dev/sda2 of type linux native.
> Third partition is /dev/sda3 of type linux Swap

Kailashnath,
Even though your partitioning should work fine, you really want the
swap on the lowest numbered SCSI block you can get away with.

Several reasons for this:
o lowest block number is on the outside of the SCSI disk were data
  xfer rate is typically 80% faster than the inside.
  (someday try "time dd if=/dev/sda of=/dev/null bs=8k count=50"
   with and with out skip parameter).
o Eventualy we will have kernel dumps to swap space - and IODC
  will likely have the same limitations where on the disk
  dump can be as we have with booting from a disk (as discussed in 
  the PALO documentation).

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
