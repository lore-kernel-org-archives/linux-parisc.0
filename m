From: rubisher <rubisher@scarlet.be>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Sat, 29 Mar 2008 18:24:12 +0000
Message-ID: <47EE894C.4010004@scarlet.be>
References: <18405.27903.317733.531002@gargle.gargle.HOWL> <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com> <47E583EA.7000006@aurel32.net> <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com> <20080326162035.GB24944@colo.lackof.org> <20080328055652.GA24649@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Matthias Klose <doko@cs.tu-berlin.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	debian-release@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080328055652.GA24649@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Grant Grundler wrote:
> On Wed, Mar 26, 2008 at 10:20:35AM -0600, Grant Grundler wrote:
>> Another gcc problem report:
>>
>> That past weekend I built the latest parisc-2.6-25-rc6 kernel from
>> Kyle's tree using gcc-4.1, gcc-4.2, and gcc-4.3. All three kernels
>> booted but the networking only worked for gcc-4.1 kernel.
>=20
> Followup: gcc-42 is working too now and I'm not sure why.
> I upgraded gcc-4.3 package from 4.3.0-rcX to 4.3.1 AND all of it's
> dependencies as well.
>=20
> I looked at gcc-43 build output to check warnings related to networki=
ng
> as suggest by John David Anglin.
>=20
> I ignored the couple of warnings in drivers/net/wireless/.
>=20
>   CC [M]  drivers/net/fealnx.o
> drivers/net/fealnx.c:896:2: warning: #warning Processor architecture =
undefined!
>     No clue what this driver is for. Ignored.
>=20
>   CC [M]  drivers/net/lasi_82596.o
> drivers/net/lasi_82596.c: In function =91lan_init_chip=92:
> drivers/net/lasi_82596.c:164: warning: format =91%lx=92 expects type =
=91long unsigned int=92, but argument 3 has type =91resource_size_t=92
> drivers/net/lasi_82596.c:169: warning: format =91%lx=92 expects type =
=91long unsigned int=92, but argument 2 has type =91resource_size_t=92
>=20
> 	That's just printk format strings.
>=20
That remember me that when I discover those new warnings with gcc-4.2 <=
http://article.gmane.org/gmane.linux.ports.parisc/70>
"discards qualifiers from pointer target type", they disapeared with gc=
c-4.3 with and btw this nic wasn't working anymore=20
(no ping no ssh, ...) even thought the kernel was booting. Unfortunatel=
y, I didn't have time to investigate in more details=20
(and it wasn't question to use gcc-4.3 as new default), sorry. If you c=
ompare your kernel build output with gcc-4.2 and 4.3=20
do you also notice this differences? (even thought it could be not rela=
ted to the issue I encountered, though).

Tx,
	r.


> overshot and found this one in drivers/scsi/ interesting too:
>=20
> drivers/scsi/initio.c:2585: warning: large integer implicitly truncat=
ed to unsigned type
>=20
> matching code is:
>         cblk->senselen =3D cpu_to_le32(SENSE_SIZE);
>=20
> grundler@j6k:~/parisc-2.6-gcc43$ fgrep senselen drivers/scsi/*.h
> drivers/scsi/aha1740.h: u8 senselen;            /* Sense Length */
> drivers/scsi/initio.h:  u8 senselen;    /*31 Sense Allocation Length =
*/
> drivers/scsi/megaraid.h:        u8 reqsenselen;
>=20
> The code at first glance looks wrong here. Patch submitted to linux-s=
csi
> and Alan Cox (who appears to have taken on this driver last year).
>=20
>=20
> Nothing else in the drivers/net.
> A bit more in net/ though:
>   CC      net/sunrpc/svc.o
> net/sunrpc/svc.c: In function =91__svc_create_thread=92:
> net/sunrpc/svc.c:587: warning: =91oldmask.bits[0u]=92 may be used uni=
nitialized in this function
>=20
> 	Don't care since I'm not using rpc.
> 	This is probably a false positive anyway. I've found several.
>=20
> And that was it. So no warnings that seem to be related to this netwo=
rking problem. It was worth checking though.
>=20
>=20
>> I just realized it's possible the 100BT switch is dropping the packe=
ts.
>> I'll try to capture a tcpdump from the omnibook 500 side using a
>> crossover cable tonight or tomorrow since without that, I don't see
>> how this can be debugged.
>=20
> Still need to try the cross-over cable.
>=20
> grant

Hello *,

Some time ago
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
