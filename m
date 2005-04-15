From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] D380: ccio-dma issue for 64bit kernel?
Date: Fri, 15 Apr 2005 11:44:11 +0200
Message-ID: <420889870001AEAE@mail-4-bnl.tiscali.it>
References: <42134E6200017045@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42134E6200017045@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> > On Thu, 2005-04-14 at 14:39 +0200, Joel Soete wrote:
> > > wax at 0xffffffffffe00000 found.
> > > Wax EISA Adapter found at 0xfffffffffc000000
> > > Enumerating EISA bus
> > >
> > > Any idea?
> >
> > Yes, disable EISA ... EISA is toxic to 64 bit kernels.
> >
> Ah ok (I haven't any EISA card just 4 gsc one :-) )
> 
well another pb: system hung after:
...
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffffffffffd07000, IRQ 18
eth0: 82596 at 0xffffffffffd07000, 00 00 00 00 08 00 IRQ 18.
zalon_probe: Zalon version 1, IRQ 66
ncr53c720-0: rev 0xf irq 66
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
scsi: Device offlined - not ready after error recovery: host 0 channel 0
id 0 lu
n 0
scsi: Device offlined - not ready after error recovery: host 0 channel 0
id 5 lu
n 0

while usualy with 32bit it find well:
...
scsi0 : ncr53c8xx-3.4.3g
  Vendor: SEAGATE   Model: ST39173WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:5: Beginning Domain Validation
 target0:0:5: asynchronous.
 target0:0:5: wide asynchronous.
 target0:0:5: Domain Validation skipping write tests
 target0:0:5: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:5: Ending Domain Validation
  Vendor: SEAGATE   Model: ST39236LC         Rev: HP02
  Type:   Direct-Access                      ANSI SCSI revision: 03
 target0:0:8: Beginning Domain Validation
 target0:0:8: asynchronous.
 target0:0:8: wide asynchronous.
 target0:0:8: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:8: Ending Domain Validation
  Vendor: SEAGATE   Model: ST32550W          Rev: HP12
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:9: Beginning Domain Validation
 target0:0:9: asynchronous.
 target0:0:9: wide asynchronous.
 target0:0:9: Domain Validation skipping write tests
 target0:0:9: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:9: Ending Domain Validation
  Vendor: SEAGATE   Model: ST32550W          Rev: HP12
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:10: Beginning Domain Validation
 target0:0:10: asynchronous.
 target0:0:10: wide asynchronous.
 target0:0:10: Domain Validation skipping write tests
 target0:0:10: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:10: Ending Domain Validation
...

Thanks again,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
