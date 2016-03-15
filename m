From: Helge Deller <deller@gmx.de>
Subject: Re: HP RP8440 Server - Superdome
Date: Tue, 15 Mar 2016 12:38:19 +0100
Message-ID: <56E7F42B.1000803@gmx.de>
References: <000601d17e21$4c45fa10$e4d1ee30$@co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Mike Hosken <mike@csystems.co.nz>, debian-hppa@lists.debian.org
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <000601d17e21$4c45fa10$e4d1ee30$@co.nz>
Resent-Message-ID: <YSj8-hHv9SD.A.78D.JR_5WB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/56E7F42B.1000803@gmx.de

Hi Mike,

On 14.03.2016 19:42, Mike Hosken wrote:
> Hi I have just acquired a HP RP8440 Server with the following specs-
>=20
> 9 x HP PA-8900 @ 1.067 dual core CPU,
> 24 x HP 4GB SuperDome Memory Modules,
> 4 x 146GB 15000rpm Wide Ultra320 SCSI HDDs,
> 48 X hp 0950-4741 Voltage Regulator Module (VRM),
> 3 x HP A9837-60303 HP PCA - Common PDH Daughter card (RoHS),
> 6 x HP AD193-8001 PCI-X 2-Port 4GB FC & 2-Port 1000BT adapter,
> 3x HP AB290-80001 PCI-X 2-Port U320 SCSI Adapter,
> 2x HP AB314-0002A Core I/O Board,
> 2x HP 0950-4637 Power Module 48VDC,
> DVD-RW,
> HP StorageWorks Dat72,
> 3x HP 0957-2183 PSUs

nice :-)

> My question is will Debian HPPA Linux support this hardware or should I=
 keep to the HP-UX.

Actually, I don't know.
Processors, Memory and probably SCSI should work with current kernels.
But I have no clue about the glue/logic chips in there.

In the wiki (https://parisc.wiki.kernel.org/index.php/Hardware_support) w=
e just have this sentence:
Support for Superdome will someday follow but requires some additional VM=
 work which is in progress.
But I don't know which kind of "VM work" is necessary...

Couldn't you just try at least once the boot image as described here:
https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
and then send us the logs. I think this can give some insights.

Helge

> I=92m planning on using this server for web hosting, Email and MYSQL et=
c,  replacing my A400 and A180c
>=20
> Any advise would be appreciated =20
>=20
> Thanks
> Mike
