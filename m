From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Thu, 27 Mar 2008 23:56:52 -0600
Message-ID: <20080328055652.GA24649@colo.lackof.org>
References: <18405.27903.317733.531002@gargle.gargle.HOWL> <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com> <47E583EA.7000006@aurel32.net> <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com> <20080326162035.GB24944@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Matthias Klose <doko@cs.tu-berlin.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	debian-release@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080326162035.GB24944@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 26, 2008 at 10:20:35AM -0600, Grant Grundler wrote:
> Another gcc problem report:
>=20
> That past weekend I built the latest parisc-2.6-25-rc6 kernel from
> Kyle's tree using gcc-4.1, gcc-4.2, and gcc-4.3. All three kernels
> booted but the networking only worked for gcc-4.1 kernel.

=46ollowup: gcc-42 is working too now and I'm not sure why.
I upgraded gcc-4.3 package from 4.3.0-rcX to 4.3.1 AND all of it's
dependencies as well.

I looked at gcc-43 build output to check warnings related to networking
as suggest by John David Anglin.

I ignored the couple of warnings in drivers/net/wireless/.

  CC [M]  drivers/net/fealnx.o
drivers/net/fealnx.c:896:2: warning: #warning Processor architecture un=
defined!
    No clue what this driver is for. Ignored.

  CC [M]  drivers/net/lasi_82596.o
drivers/net/lasi_82596.c: In function =E2=80=98lan_init_chip=E2=80=99:
drivers/net/lasi_82596.c:164: warning: format =E2=80=98%lx=E2=80=99 exp=
ects type =E2=80=98long unsigned int=E2=80=99, but argument 3 has type =
=E2=80=98resource_size_t=E2=80=99
drivers/net/lasi_82596.c:169: warning: format =E2=80=98%lx=E2=80=99 exp=
ects type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type =
=E2=80=98resource_size_t=E2=80=99

	That's just printk format strings.

overshot and found this one in drivers/scsi/ interesting too:

drivers/scsi/initio.c:2585: warning: large integer implicitly truncated=
 to unsigned type

matching code is:
        cblk->senselen =3D cpu_to_le32(SENSE_SIZE);

grundler@j6k:~/parisc-2.6-gcc43$ fgrep senselen drivers/scsi/*.h
drivers/scsi/aha1740.h: u8 senselen;            /* Sense Length */
drivers/scsi/initio.h:  u8 senselen;    /*31 Sense Allocation Length */
drivers/scsi/megaraid.h:        u8 reqsenselen;

The code at first glance looks wrong here. Patch submitted to linux-scs=
i
and Alan Cox (who appears to have taken on this driver last year).


Nothing else in the drivers/net.
A bit more in net/ though:
  CC      net/sunrpc/svc.o
net/sunrpc/svc.c: In function =E2=80=98__svc_create_thread=E2=80=99:
net/sunrpc/svc.c:587: warning: =E2=80=98oldmask.bits[0u]=E2=80=99 may b=
e used uninitialized in this function

	Don't care since I'm not using rpc.
	This is probably a false positive anyway. I've found several.

And that was it. So no warnings that seem to be related to this network=
ing problem. It was worth checking though.


> I just realized it's possible the 100BT switch is dropping the packet=
s.
> I'll try to capture a tcpdump from the omnibook 500 side using a
> crossover cable tonight or tomorrow since without that, I don't see
> how this can be debugged.

Still need to try the cross-over cable.

grant
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
