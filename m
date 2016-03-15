From: Frank Benke <frank@mybenke.org>
Subject: Re: HP RP8440 Server - Superdome
Date: Tue, 15 Mar 2016 12:42:54 +0100
Message-ID: <CAF7WtFX2QAuFGQWvfNzF03NBgO-CBkyGRFCPBNVDRU1QeohApg@mail.gmail.com>
References: <000601d17e21$4c45fa10$e4d1ee30$@co.nz>
	<56E7F42B.1000803@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Mike Hosken <mike@csystems.co.nz>,
	HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56E7F42B.1000803@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

all I know about the System ist that it has a cellboard based
architecture, and that there was never enough documentation released
that the according memory management could be programmed in Linux.

So probably this will not work.

May be on an physical partition level, there might be a chance, since
the single cellboard is pretty similar to the L-Class.

I personally would try to get the partition management on the RP
running and install one partition HP-UX and then try to work with
linux on an additional partition. Everything else would be rather
sporty.

Best regards.

On Tue, Mar 15, 2016 at 12:38 PM, Helge Deller <deller@gmx.de> wrote:
> Hi Mike,
>
> On 14.03.2016 19:42, Mike Hosken wrote:
>> Hi I have just acquired a HP RP8440 Server with the following specs-
>>
>> 9 x HP PA-8900 @ 1.067 dual core CPU,
>> 24 x HP 4GB SuperDome Memory Modules,
>> 4 x 146GB 15000rpm Wide Ultra320 SCSI HDDs,
>> 48 X hp 0950-4741 Voltage Regulator Module (VRM),
>> 3 x HP A9837-60303 HP PCA - Common PDH Daughter card (RoHS),
>> 6 x HP AD193-8001 PCI-X 2-Port 4GB FC & 2-Port 1000BT adapter,
>> 3x HP AB290-80001 PCI-X 2-Port U320 SCSI Adapter,
>> 2x HP AB314-0002A Core I/O Board,
>> 2x HP 0950-4637 Power Module 48VDC,
>> DVD-RW,
>> HP StorageWorks Dat72,
>> 3x HP 0957-2183 PSUs
>
> nice :-)
>
>> My question is will Debian HPPA Linux support this hardware or shoul=
d I keep to the HP-UX.
>
> Actually, I don't know.
> Processors, Memory and probably SCSI should work with current kernels=
=2E
> But I have no clue about the glue/logic chips in there.
>
> In the wiki (https://parisc.wiki.kernel.org/index.php/Hardware_suppor=
t) we just have this sentence:
> Support for Superdome will someday follow but requires some additiona=
l VM work which is in progress.
> But I don't know which kind of "VM work" is necessary...
>
> Couldn't you just try at least once the boot image as described here:
> https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
> and then send us the logs. I think this can give some insights.
>
> Helge
>
>> I=E2=80=99m planning on using this server for web hosting, Email and=
 MYSQL etc,  replacing my A400 and A180c
>>
>> Any advise would be appreciated
>>
>> Thanks
>> Mike
>



--=20
In theory, there is no difference between theory and practice.  In
practice, there is.

My Blogg: http://www.mybenke.org
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
