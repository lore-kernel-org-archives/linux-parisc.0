Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75D774927
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 01:56:49 -0700 (MST)
Date: Mon, 23 Feb 2004 09:16:16 +0100
Message-ID: <402A42A100007EE7@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] b2k scsi disk pb
To: "Grant Grundler" <grundler@parisc-linux.org>, "M. Grabert" <xam@cs.ucc.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Grant,

>The "hang" is because no IO's are processed until 3 seconds
>after the BUS RESET is issued.

Typicaly the behaviour observed.

>> Got rid of it by not using the SE-SCSI driver ;)
>> Try to physically detach the (not-used) ST336704LC.
>
>I was pretty sure "LC" suffix meant LVD with SCA 80 pin connector.
>Specs on seagate.com are easy to find if you know the model.

In fact according <http://www.seagate.com/cgi-bin/view.cgi?/scsi/st336704.lw>
it has the two possiblity SE or LVD according HW config (a side jumper J2
if i well understand)

>If both internal devices are LVD, check early sym2 dmesg output
>to verify the SCSI bus is operating in LVD mode (vs SE).

But here they seems to work together in LVD mode:
[snip]

Uniform CD-ROM driver Revision: 3.20
sym0: <895a> rev 0x1 at pci 0000:00:0f.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18i
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT opera
ion complete.
sym0:0:0: DEVICE RESET operation started.
sym0:0:0: DEVICE RESET operation failed.
sym0:0:0: BUS RESET operation started.
sym0:0:0: BUS RESET operation failed.
sym0:0:0: HOST RESET operation started.
sym0:0:0: HOST RESET operation failed.
scsi: Device offlined - not ready after error recovery: host 0 channel 0
id 0 lun 0
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:5:0: tagged command queuing enabled, command queue depth 16.
sym0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
  Vendor: SEAGATE   Model: ST336704LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:6:0: tagged command queuing enabled, command queue depth 16.
sym0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
[snip]

Anyway what sym2 look for at scsi id 0?

I will try also later to remove ST disk ad advise ;)

Thanks for attention and advise,
    Joel




----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
