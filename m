From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: delay in disc detection causes boot failure
Date: Tue, 31 Mar 2009 12:30:53 +0200
Message-ID: <7d01f9f00903310330j50c1a8fl63502ddfd406f9c9@mail.gmail.com>
References: <49D118F7.5040809@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: AlesD <ales_d@seznam.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49D118F7.5040809@seznam.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/3/30 AlesD <ales_d@seznam.cz>:
> Hello,
>
> =C2=A0I have installed HP-PA port of Debian 5.0 and got into followin=
g problem.
>
> The root filesystem is on SW RAID. At the end of kernel initializatio=
n comes
> reset on SCSI bus. After this reset it takes about 6 seconds before t=
he
> attached SCSI disks become "visible" and are detected by kernel. The
> initialization process however goes on and during this 6s it tries to
> assemble the MD device. Since the discs do not exist yet the assembly=
 fails
> and root filesystem is not found. The init script waits 3 minutes bef=
ore
> giving up - which would normaly do the trick if the root was directly=
 in one
> partition. With RAID (and LVM a top of it) the init ends with fiasco.
>
> To overcome this I put simple "sleep 30" in the initram scripts - jus=
t
> before assembly of the MD device. I understand that this issue is mor=
e for
> Debian, but before reporting ther I'd like to ask here:
> 1) does anyone here know, why there is the reset/delay during boot, a=
nd
> 2) and if message "Driver 'sd' needs updating - please use bus_type m=
ethods"
> might have anything to do with this problem.

I've experienced similar problem with root on raid and Debian kernels.
It's definitely a Debian specific issue, afaict.

HTH

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
