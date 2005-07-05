From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Setting up IDE CD-ROM on HPPA B2000
Date: Tue, 5 Jul 2005 10:08:07 +0100
Message-ID: <e6eae02905070502088c7343f__38082.2682207965$1416623834$gmane$org@mail.gmail.com>
References: <5.1.1.6.1.20050705144330.02b5c6f0@pop.singnet.com.sg>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050705144330.02b5c6f0@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 05/07/05, J. L. Lee <jllee@singnet.com.sg> wrote:
> ps. Any downside in setting up IDE CD-ROM as IDE-SCSI CD-ROM?

Yes, DMA  is not supported in ide-scsi.
That means slower transfer rates (around 3MB/s) and higher CPU load.
If you are burning CDs/DVDs this means that it is more likely that
you will have buffer underruns and it limits how fast you can burn your CDs=
.

However ide-scsi used to have better error detection & reporting,
but I think in the last couple of months ide-cd has caught up with
ide-scsi in that repect.

Since it seems that DMA support is broken with the ns87415 IDE chipset
driver anyway it doesn't really matter whether we use ide-scsi or ide-cd
I guess.

> pps. You might see the following msg but I believe it is harmless:
>=20
> modprobe -k ide-mod options=3D"hda=3Dide-scsi"
> FATAL: Module ide_mod not found.

This is because it tries to load the generic IDE driver as a module, but
you have compiled it into the kernel statically.
This is indeed harmless.

> pps. You might also see the following msg: (Does 'deprecated for cd
> burning' msg mean that we can burn CDs if we have a CD/RW drive?)

Yes, you (still) can, but it is not recommended.
cdrecord works fine for me (as root, the usual linux >2.6.8 problem).

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
