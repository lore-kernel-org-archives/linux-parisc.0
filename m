Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D3BF4878
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Nov 2002 09:27:34 -0700 (MST)
Date: Thu, 28 Nov 2002 17:27:17 +0100
Message-ID: <3DB577610000573D@ocpmta8.be.tiscali.com>
In-Reply-To: <3DB57761000056CD@ocpmta8.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: Re: FW: RE: [parisc-linux] 2.4.20-rc1-pa7 boot problem on b180
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "Ryan Bradetich" <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>the less by curiosity I apply the Ryan patch: <http://lists.parisc-linux=
.org/pipermail/parisc-linux/2002-November/018414.html>
>and it also solved the problem of the b180 boot???
>

Don't know if could help but I also notice the following difference at bo=
ot
time:

With highmem_io=3D1 on a b2000
sym1: SCSI BUS has been reset.
scsi0 : sym-2.1.17a
scsi1 : sym-2.1.17a
blk: queue 100aca74, I/O limit 4095Mb (mask 0xffffffff)??? blk_queue_boun=
ce_limit
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
blk: queue 100acb74, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
blk: queue 100acc74, I/O limit 4095Mb (mask 0xffffffff)
sym1:5:0: tagged command queuing enabled, command queue depth 16.
sym1:6:0: tagged command queuing enabled, command queue depth 16.


with highmem_io=3D0 on a b180
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.17a
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: IBM       Model: DDRS-39130WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:5:0: tagged command queuing enabled, command queue depth 16.
sym0:6:0: tagged command queuing enabled, command queue depth 16.

hth,
    Joel


*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
