From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Kernel panic while mounting a CD-ROM drive
Date: Fri, 17 Jun 2005 16:38:15 +0100
Message-ID: <e6eae029050617083864c0379c__10657.2296740071$1416623804$gmane$org@mail.gmail.com>
References: <5.1.1.6.1.20050617230817.02aae7d0@pop.singnet.com.sg>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050617230817.02aae7d0@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/17/05, J. L. Lee <jllee@singnet.com.sg> wrote:
>  Hi,
>=20
>  I set up my B2000 (with PCI Matrox Millennum II card) to run on kernel
> 2.6.11-rc6-pa1 a few days ago and was able to mount the CD-ROM drive and
> used it on several occassions. However it kept on causing kernel panic an=
d
> froze the B2000 whenever I tried to mount the CD-ROM drive since today.=
=20
>=20
>  The difference then and now (since I last used the CD-ROM drive) is that=
 I
> have installed successfully a X Windows package. Could this be the reason=
?

Sounds rather unlikely ...
=20
> I have tried both init level 2 & 3 but this did not make a difference.
> Any idea what went wrong?

Perhaps you are using the ide-cd driver in the kernel?
It is known to cause a HPMC on PA ...
Make sure you don't have ide-cd (IDE ATAPI CD-ROM support) enabled
in the kernel, but use ide-scsi (IDE SCSI Emulation) instead
(and enable SCSI CD-ROM support).
You also might need to append "hda=3Dide-scsi" in your kernel boot
options (/etc/palo.conf)

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
