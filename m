Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Smith <james@compusmithllc.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Disk problems 
In-Reply-To: Message from James Smith <james@compusmithllc.com>
   of "27 Nov 2002 17:20:56 EST." <1038435657.1271.14.camel@seventy>
References: <3DA3DE66000072D5@ocpmta4.be.tiscali.com>  <1038435657.1271.14.camel@seventy> 
Date: Mon, 02 Dec 2002 22:01:58 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021203050158.234184829@dsl2.external.hp.com>
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

James Smith wrote:
> how do i find the firmware number for the drives?

grundler@c3k:~$ cat /proc/scsi/scsi
Attached devices: 
Host: scsi1 Channel: 00 Id: 05 Lun: 00
  Vendor: SEAGATE  Model: ST118202LC       Rev: 7D04
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi1 Channel: 00 Id: 06 Lun: 00
  Vendor: SEAGATE  Model: ST118202LC       Rev: HP03
  Type:   Direct-Access                    ANSI SCSI revision: 02
grundler@c3k:~$ 

"Rev" is the drive firmware.

grant
