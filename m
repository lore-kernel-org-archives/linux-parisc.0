Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay1.cc.umr.edu [131.151.1.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id 574914829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 08:15:51 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Subject: RE: [parisc-linux] boot (micro) hang
Date: Wed, 9 Oct 2002 09:13:43 -0500
Message-ID: <2B45A04D8F18D947A400F0850CE3B53B060DB4@umr-mail7.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "Ryan Bradetich" <rbradetich@uswest.net>,
	"phi" <phi@hpfrcu81.france.hp.com>
Cc: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
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

I've seen it on a J200. Just haven't been doing much with it, and stuck
with older kernel until I had time to dig into it.=20

00000000-17ffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002f7fff : Kernel code
  002f8000-003f3677 : Kernel data
f0190000-f0190000 : lcd_cmd
f0190001-f0190001 : lcd_data
f3f80000-f3fbffff : GSC Bus [8/]
  f3f80000-f3f80fff : GSC SCSI (Zalon)
f3fc0000-ffbfffff : GSC Bus [10/]
  fc000000-ffbfffff : EISA
    fc000000-fc000fff : EISA Bus Adapter
ffc00000-ffdfffff : GSC Bus [8/]
  ffd00000-ffdfffff : Lasi
    ffd00000-ffd00fff : Lasi
    ffd02000-ffd02fff : Parallel
    ffd04000-ffd04fff : Lasi Harmony
    ffd05000-ffd05fff : Serial RS232
    ffd06000-ffd06fff : Lasi SCSI
    ffd07000-ffd07fff : Apricot
    ffd08000-ffd08fff : Lasi psaux
ffe00000-ffe3ffff : GSC Bus [10/]
  ffe00000-ffe00fff : Wax
  ffe01000-ffe01fff : HP SDC
  ffe02000-ffe02fff : Serial RS232
fff80000-fffaffff : Central Bus
  fff88000-fff88fff : U2/Uturn
  fff8a000-fff8afff : U2/Uturn
  fffa0000-fffa0fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast


Although I am not 100% certain that it's the same thing, as I've never
waited long enough for that message to go away.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216


> -----Original Message-----
> From: Ryan Bradetich [mailto:rbradetich@uswest.net]=20
> Sent: Wednesday, October 09, 2002 9:05 AM
> To: phi
> Cc: Grant Grundler; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] boot (micro) hang
>=20
>=20
> *sigh* =20
>=20
> This is due to a change I made to detect devices on the E=20
> class systems.
>=20
> Before we encountered the E Class systems, the devices were always at
> the bottom of the range, but E Class put them at the top. =20
> The function
> will break out once a device is found ... it appears that your system
> also has the devices towards the top of the io range.
>=20
> post the contents of /proc/iomem and I can verify this for sure.  We
> need to come up with a better way for discovering these devices. =20
>=20
> btw, what model system is this?
>=20
> Thanks,
>=20
> - Ryan
>=20
>=20
> P.S. the reason it worked before is because it only walked the first
> 0 - 63 devices with in that range.  Not it walks the entire range
> until it finds a device.
>=20
>=20
> On Wed, 2002-10-09 at 06:44, phi wrote:
> > Grant Grundler wrote:
> > > The long delay happens during device discovery.
> > > You could enable EARLY_BOOTUP_DEBUG in=20
> arch/parisc/kernel/pdc_cons.c
> > > and add some printk's to the loop in system_map_inventory().
> > >=20
> > > Only two pieces of code really get executed during that time.
> > > One is the PDC calls - verify your firmware is the latest=20
> and if it
> > > isn't, please update.  The other might be GSC buswalk=20
> code. I thought
> > > the bus's under U2 are walked to detect devices not listed by PDC.
> > > But I don't know exactly when that occurs in the boot sequence.
> > >=20
> > > grant
> >=20
> > My Firmware is
> >=20
> > Firmware Version  5.2
> > Duplex Console IO Dependent Code (IODC) revision 1
> > Boot IO Dependent Code (IODC) revision 153
> >=20
> >=20
> > Dunno if this is good enuff. At least it works for old kernel.
> >=20
> >=20
> > =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > printk() into walk_native_bus() as follow shos this.
> >=20
> > static void walk_native_bus(unsigned long io_io_low,=20
> unsigned long io_io_high,
> >                             struct parisc_device *parent)
> > {
> >         int i, devices_found =3D 0;
> >         unsigned long hpa =3D io_io_low;
> >         struct hardware_path path;
> >=20
> > printk("1.1 low=3D0x%08x high=3D0x%08x\n",io_io_low,io_io_high);
> >         get_node_path(parent, &path);
> >         do {
> > printk("1.2 i=3D%d hpa=3D0x%08x\n",0,hpa);
> >                 for (i =3D 0; i < MAX_NATIVE_DEVICES; i++, hpa +=3D
> > NATIVE_DEVICE_OF
> > FSET) {
> >                         struct parisc_device *dev;
> >=20
> >                         /* Was the device already added by=20
> Firmware? */
> >                         dev =3D find_device_by_addr(hpa);
> >                         if (!dev) {
> >                                 path.mod =3D i;
> > printk("1.3 i=3D%d hpa=3D0x%08x\n",i,hpa);
> >                                 dev =3D alloc_pa_dev(hpa, &path);
> >                                 if (!dev)
> >                                         continue;
> >=20
> > printk("1.4\n");
> >                                 register_parisc_device(dev);
> >                                 devices_found++;
> >                         }
> >                         walk_lower_bus(dev);
> >                 }
> >         } while (!devices_found && hpa < io_io_high);
> > }
> >=20
> > 1.1 low=3D0xfff80000 high=3D0xfffc0000
> > 1.2 i=3D0 hpa=3D0xfff80000
> > 1.3 i=3D0 hpa=3D0xfff80000
> > 1.3 i=3D1 hpa=3D0xfff81000
> > 1.3 i=3D2 hpa=3D0xfff82000
> > 1.3 i=3D3 hpa=3D0xfff83000
> > 1.3 i=3D4 hpa=3D0xfff84000
> > 1.3 i=3D5 hpa=3D0xfff85000
> > 1.3 i=3D6 hpa=3D0xfff86000
> > 1.3 i=3D7 hpa=3D0xfff87000
> > 1.3 i=3D8 hpa=3D0xfff88000
> > 1.4
> > 1.1 low=3D0xf2000000 high=3D0xf4000000
> > 1.2 i=3D0 hpa=3D0xf2000000
> > 1.3 i=3D1 hpa=3D0xf2001000
> > 1.4
> > 1.3 i=3D2 hpa=3D0xf2002000
> > 1.3 i=3D3 hpa=3D0xf2003000
> > 1.4
> > 1.3 i=3D4 hpa=3D0xf2004000
> > 1.3 i=3D5 hpa=3D0xf2005000
> > 1.3 i=3D6 hpa=3D0xf2006000
> > 1.3 i=3D7 hpa=3D0xf2007000
> > 1.3 i=3D8 hpa=3D0xf2008000
> > 1.3 i=3D9 hpa=3D0xf2009000
> > 1.3 i=3D10 hpa=3D0xf200a000
> > 1.3 i=3D11 hpa=3D0xf200b000
> > 1.3 i=3D13 hpa=3D0xf200d000
> > 1.3 i=3D14 hpa=3D0xf200e000
> > 1.3 i=3D15 hpa=3D0xf200f000
> > 1.3 i=3D16 hpa=3D0xf2010000
> > 1.3 i=3D17 hpa=3D0xf2011000
> > 1.3 i=3D18 hpa=3D0xf2012000
> > 1.3 i=3D19 hpa=3D0xf2013000
> > 1.3 i=3D20 hpa=3D0xf2014000
> > 1.3 i=3D21 hpa=3D0xf2015000
> > 1.3 i=3D22 hpa=3D0xf2016000
> > 1.3 i=3D23 hpa=3D0xf2017000
> > 1.3 i=3D24 hpa=3D0xf2018000
> > 1.3 i=3D25 hpa=3D0xf2019000
> > 1.3 i=3D26 hpa=3D0xf201a000
> > 1.3 i=3D27 hpa=3D0xf201b000
> > 1.3 i=3D28 hpa=3D0xf201c000
> > 1.3 i=3D29 hpa=3D0xf201d000
> > 1.3 i=3D30 hpa=3D0xf201e000
> > 1.3 i=3D31 hpa=3D0xf201f000
> > 1.3 i=3D32 hpa=3D0xf2020000
> > 1.3 i=3D33 hpa=3D0xf2021000
> > 1.3 i=3D34 hpa=3D0xf2022000
> > 1.3 i=3D35 hpa=3D0xf2023000
> > 1.3 i=3D36 hpa=3D0xf2024000
> > 1.3 i=3D37 hpa=3D0xf2025000
> > 1.3 i=3D38 hpa=3D0xf2026000
> > 1.3 i=3D39 hpa=3D0xf2027000
> > 1.3 i=3D40 hpa=3D0xf2028000
> > 1.3 i=3D41 hpa=3D0xf2029000
> > 1.3 i=3D42 hpa=3D0xf202a000
> > 1.3 i=3D43 hpa=3D0xf202b000
> > 1.3 i=3D44 hpa=3D0xf202c000
> > 1.3 i=3D45 hpa=3D0xf202d000
> > 1.3 i=3D46 hpa=3D0xf202e000
> > 1.3 i=3D47 hpa=3D0xf202f000
> > 1.3 i=3D48 hpa=3D0xf2030000
> > 1.3 i=3D49 hpa=3D0xf2031000
> > 1.3 i=3D50 hpa=3D0xf2032000
> > 1.3 i=3D51 hpa=3D0xf2033000
> > 1.3 i=3D52 hpa=3D0xf2034000
> > 1.3 i=3D53 hpa=3D0xf2035000
> > 1.3 i=3D54 hpa=3D0xf2036000
> > 1.3 i=3D55 hpa=3D0xf2037000
> > 1.3 i=3D56 hpa=3D0xf2038000
> > 1.3 i=3D57 hpa=3D0xf2039000
> > 1.3 i=3D58 hpa=3D0xf203a000
> > 1.3 i=3D59 hpa=3D0xf203b000
> > 1.3 i=3D60 hpa=3D0xf203c000
> > 1.3 i=3D61 hpa=3D0xf203d000
> > 1.3 i=3D62 hpa=3D0xf203e000
> > 1.3 i=3D9 hpa=3D0xfff89000
> > 1.3 i=3D10 hpa=3D0xfff8a000
> > 1.4
> > 1.1 low=3D0xf1000000 high=3D0xf2000000
> > 1.2 i=3D0 hpa=3D0xf1000000
> > 1.3 i=3D0 hpa=3D0xf1000000
> > 1.3 i=3D1 hpa=3D0xf1001000
> > 1.3 i=3D2 hpa=3D0xf1002000
> > 1.3 i=3D3 hpa=3D0xf1003000
> > 1.3 i=3D4 hpa=3D0xf1004000
> > 1.3 i=3D5 hpa=3D0xf1005000
> > 1.3 i=3D6 hpa=3D0xf1006000
> > 1.3 i=3D7 hpa=3D0xf1007000
> > 1.3 i=3D8 hpa=3D0xf1008000
> > 1.3 i=3D9 hpa=3D0xf1009000
> > 1.3 i=3D10 hpa=3D0xf100a000
> > 1.3 i=3D11 hpa=3D0xf100b000
> > 1.3 i=3D12 hpa=3D0xf100c000
> > 1.3 i=3D13 hpa=3D0xf100d000
> > 1.3 i=3D14 hpa=3D0xf100e000
> > 1.3 i=3D15 hpa=3D0xf100f000
> > 1.3 i=3D16 hpa=3D0xf1010000
> > 1.3 i=3D17 hpa=3D0xf1011000
> > 1.3 i=3D18 hpa=3D0xf1012000
> > 1.3 i=3D19 hpa=3D0xf1013000
> > 1.3 i=3D20 hpa=3D0xf1014000
> > 1.3 i=3D21 hpa=3D0xf1015000
> > 1.3 i=3D22 hpa=3D0xf1016000
> > 1.3 i=3D23 hpa=3D0xf1017000
> > 1.3 i=3D24 hpa=3D0xf1018000
> > 1.3 i=3D25 hpa=3D0xf1019000
> > 1.3 i=3D26 hpa=3D0xf101a000
> > 1.3 i=3D27 hpa=3D0xf101b000
> > 1.3 i=3D28 hpa=3D0xf101c000
> > 1.3 i=3D29 hpa=3D0xf101d000
> > 1.3 i=3D30 hpa=3D0xf101e000
> > 1.3 i=3D31 hpa=3D0xf101f000
> > 1.3 i=3D32 hpa=3D0xf1020000
> > 1.3 i=3D33 hpa=3D0xf1021000
> > 1.3 i=3D34 hpa=3D0xf1022000
> > 1.3 i=3D35 hpa=3D0xf1023000
> > 1.3 i=3D36 hpa=3D0xf1024000
> > 1.3 i=3D37 hpa=3D0xf1025000
> > 1.3 i=3D38 hpa=3D0xf1026000
> > 1.3 i=3D39 hpa=3D0xf1027000
> > 1.3 i=3D40 hpa=3D0xf1028000
> > 1.3 i=3D41 hpa=3D0xf1029000
> > 1.3 i=3D42 hpa=3D0xf102a000
> > 1.3 i=3D43 hpa=3D0xf102b000
> > 1.3 i=3D44 hpa=3D0xf102c000
> > 1.3 i=3D45 hpa=3D0xf102d000
> > 1.3 i=3D46 hpa=3D0xf102e000
> > 1.3 i=3D47 hpa=3D0xf102f000
> > 1.3 i=3D48 hpa=3D0xf1030000
> > 1.3 i=3D49 hpa=3D0xf1031000
> > 1.3 i=3D50 hpa=3D0xf1032000
> > 1.3 i=3D51 hpa=3D0xf1033000
> > 1.3 i=3D52 hpa=3D0xf1034000
> > 1.3 i=3D53 hpa=3D0xf1035000
> > 1.3 i=3D54 hpa=3D0xf1036000
> > 1.3 i=3D55 hpa=3D0xf1037000
> > 1.3 i=3D56 hpa=3D0xf1038000
> > 1.3 i=3D57 hpa=3D0xf1039000
> > 1.3 i=3D58 hpa=3D0xf103a000
> > 1.3 i=3D59 hpa=3D0xf103b000
> > 1.3 i=3D60 hpa=3D0xf103c000
> > 1.3 i=3D61 hpa=3D0xf103d000
> > 1.3 i=3D62 hpa=3D0xf103e000
> > 1.2 i=3D0 hpa=3D0xf1040000
> > 1.3 i=3D0 hpa=3D0xf1040000
> > 1.3 i=3D1 hpa=3D0xf1041000
> > 1.3 i=3D2 hpa=3D0xf1042000
> > 1.3 i=3D3 hpa=3D0xf1043000
> > 1.3 i=3D4 hpa=3D0xf1044000
> > 1.3 i=3D5 hpa=3D0xf1045000
> > 1.3 i=3D6 hpa=3D0xf1046000
> > 1.3 i=3D7 hpa=3D0xf1047000
> > 1.3 i=3D8 hpa=3D0xf1048000
> > 1.3 i=3D9 hpa=3D0xf1049000
> > 1.3 i=3D10 hpa=3D0xf104a000
> > 1.3 i=3D11 hpa=3D0xf104b000
> > 1.3 i=3D12 hpa=3D0xf104c000
> > 1.3 i=3D13 hpa=3D0xf104d000
> > 1.3 i=3D14 hpa=3D0xf104e000
> > 1.3 i=3D15 hpa=3D0xf104f000
> > 1.3 i=3D16 hpa=3D0xf1050000
> > 1.3 i=3D17 hpa=3D0xf1051000
> > 1.3 i=3D18 hpa=3D0xf1052000
> > 1.3 i=3D19 hpa=3D0xf1053000
> > 1.3 i=3D20 hpa=3D0xf1054000
> > 1.3 i=3D21 hpa=3D0xf1055000
> > 1.3 i=3D22 hpa=3D0xf1056000
> > 1.3 i=3D23 hpa=3D0xf1057000
> > 1.3 i=3D24 hpa=3D0xf1058000
> > 1.3 i=3D25 hpa=3D0xf1059000
> > 1.3 i=3D26 hpa=3D0xf105a000
> > 1.3 i=3D27 hpa=3D0xf105b000
> > 1.3 i=3D28 hpa=3D0xf105c000
> > 1.3 i=3D29 hpa=3D0xf105d000
> > 1.3 i=3D30 hpa=3D0xf105e000
> > 1.3 i=3D31 hpa=3D0xf105f000
> > 1.3 i=3D32 hpa=3D0xf1060000
> > 1.3 i=3D33 hpa=3D0xf1061000
> > 1.3 i=3D34 hpa=3D0xf1062000
> > 1.3 i=3D35 hpa=3D0xf1063000
> > 1.3 i=3D36 hpa=3D0xf1064000
> > 1.3 i=3D37 hpa=3D0xf1065000
> > 1.3 i=3D38 hpa=3D0xf1066000
> > 1.3 i=3D39 hpa=3D0xf1067000
> > 1.3 i=3D40 hpa=3D0xf1068000
> > 1.3 i=3D41 hpa=3D0xf1069000
> > 1.3 i=3D42 hpa=3D0xf106a000
> > 1.3 i=3D43 hpa=3D0xf106b000
> > 1.3 i=3D44 hpa=3D0xf106c000
> > 1.3 i=3D45 hpa=3D0xf106d000
> > 1.3 i=3D46 hpa=3D0xf106e000
> > 1.3 i=3D47 hpa=3D0xf106f000
> > 1.3 i=3D48 hpa=3D0xf1070000
> > 1.3 i=3D49 hpa=3D0xf1071000
> > 1.3 i=3D50 hpa=3D0xf1072000
> > 1.3 i=3D51 hpa=3D0xf1073000
> > 1.3 i=3D52 hpa=3D0xf1074000
> > 1.3 i=3D53 hpa=3D0xf1075000
> > 1.3 i=3D54 hpa=3D0xf1076000
> > 1.3 i=3D55 hpa=3D0xf1077000
> > 1.3 i=3D56 hpa=3D0xf1078000
> > 1.3 i=3D57 hpa=3D0xf1079000
> > 1.3 i=3D58 hpa=3D0xf107a000
> > 1.3 i=3D59 hpa=3D0xf107b000
> > 1.3 i=3D60 hpa=3D0xf107c000
> > 1.3 i=3D61 hpa=3D0xf107d000
> > 1.3 i=3D62 hpa=3D0xf107e000
> > 1.3 i=3D63 hpa=3D0xf107f000
> > 1.2 i=3D0 hpa=3D0xf1080000
> > 1.3 i=3D0 hpa=3D0xf1080000
> > 1.3 i=3D1 hpa=3D0xf1081000
> > 1.3 i=3D2 hpa=3D0xf1082000
> > 1.3 i=3D3 hpa=3D0xf1083000
> > 1.3 i=3D4 hpa=3D0xf1084000
> > 1.3 i=3D5 hpa=3D0xf1085000
> > 1.3 i=3D6 hpa=3D0xf1086000
> > 1.3 i=3D7 hpa=3D0xf1087000
> > 1.3 i=3D8 hpa=3D0xf1088000
> > 1.3 i=3D9 hpa=3D0xf1089000
> > 1.3 i=3D10 hpa=3D0xf108a000
> > 1.3 i=3D11 hpa=3D0xf108b000
> > 1.3 i=3D12 hpa=3D0xf108c000
> > 1.3 i=3D13 hpa=3D0xf108d000
> > 1.3 i=3D14 hpa=3D0xf108e000
> > 1.3 i=3D15 hpa=3D0xf108f000
> > 1.3 i=3D16 hpa=3D0xf1090000
> > 1.3 i=3D17 hpa=3D0xf1091000
> > 1.3 i=3D18 hpa=3D0xf1092000
> > 1.3 i=3D19 hpa=3D0xf1093000
> > 1.3 i=3D20 hpa=3D0xf1094000
> > 1.3 i=3D21 hpa=3D0xf1095000
> > 1.3 i=3D22 hpa=3D0xf1096000
> > 1.3 i=3D23 hpa=3D0xf1097000
> > 1.3 i=3D24 hpa=3D0xf1098000
> > 1.3 i=3D25 hpa=3D0xf1099000
> > 1.3 i=3D26 hpa=3D0xf109a000
> > 1.3 i=3D27 hpa=3D0xf109b000
> > 1.3 i=3D28 hpa=3D0xf109c000
> > 1.3 i=3D29 hpa=3D0xf109d000
> > 1.3 i=3D30 hpa=3D0xf109e000
> > 1.3 i=3D31 hpa=3D0xf109f000
> > 1.3 i=3D32 hpa=3D0xf10a0000
> > 1.3 i=3D33 hpa=3D0xf10a1000
> > 1.3 i=3D34 hpa=3D0xf10a2000
> > 1.3 i=3D35 hpa=3D0xf10a3000
> > 1.3 i=3D36 hpa=3D0xf10a4000
> > 1.3 i=3D37 hpa=3D0xf10a5000
> > 1.3 i=3D38 hpa=3D0xf10a6000
> > 1.3 i=3D39 hpa=3D0xf10a7000
> > 1.3 i=3D40 hpa=3D0xf10a8000
> > 1.3 i=3D41 hpa=3D0xf10a9000
> > 1.3 i=3D42 hpa=3D0xf10aa000
> > 1.3 i=3D43 hpa=3D0xf10ab000
> > 1.3 i=3D44 hpa=3D0xf10ac000
> > 1.3 i=3D45 hpa=3D0xf10ad000
> > 1.3 i=3D46 hpa=3D0xf10ae000
> > 1.3 i=3D47 hpa=3D0xf10af000
> > 1.3 i=3D48 hpa=3D0xf10b0000
> > 1.3 i=3D49 hpa=3D0xf10b1000
> > 1.3 i=3D50 hpa=3D0xf10b2000
> > 1.3 i=3D51 hpa=3D0xf10b3000
> > 1.3 i=3D52 hpa=3D0xf10b4000
> > 1.3 i=3D53 hpa=3D0xf10b5000
> > 1.3 i=3D54 hpa=3D0xf10b6000
> > 1.3 i=3D55 hpa=3D0xf10b7000
> > 1.3 i=3D56 hpa=3D0xf10b8000
> > 1.3 i=3D57 hpa=3D0xf10b9000
> > 1.3 i=3D58 hpa=3D0xf10ba000
> > 1.3 i=3D59 hpa=3D0xf10bb000
> > 1.3 i=3D60 hpa=3D0xf10bc000
> > 1.3 i=3D61 hpa=3D0xf10bd000
> > 1.3 i=3D62 hpa=3D0xf10be000
> > 1.3 i=3D63 hpa=3D0xf10bf000
> > 1.2 i=3D0 hpa=3D0xf10c0000
> >=20
> >=20
> > I am not knowledeable enough to tell if the range to walk=20
> on is valid or not,
> > but it is way too  much for my config.
> >=20
> > I wonder if this functin got the range correctly
> > void walk_lower_bus(struct parisc_device *dev)
> > {
> >         unsigned long io_io_low, io_io_high;
> >=20
> >         if(!BUS_CONVERTER(dev) || IS_LOWER_PORT(dev))
> >                 return;
> >=20
> >         io_io_low =3D ((unsigned long)(signed=20
> int)READ_IO_IO_LOW(dev) +
> > ~FLEX_MASK
> > ) & FLEX_MASK;
> >         io_io_high =3D ((unsigned long)(signed=20
> int)READ_IO_IO_HIGH(dev) +
> > ~FLEX_MA
> > SK) & FLEX_MASK;
> >=20
> >         walk_native_bus(io_io_low, io_io_high, dev);
> > }
> >=20
> >=20
> > For the time being I enforce
> >=20
> > io_io_high=3Dio_io_low+(MAX_NATIVE_DEVICES*NATIVE_DEVICE_OFFSET);
> >=20
> > In the above function which as the effect of shortening the=20
> loop and boot ok.
> > Dunno if this hack make sense, may be I would loose some=20
> devices, but I don't
> > plan to add any anyway.
> >=20
> > Phi
> >=20
> >=20
> > --
> > mailto:Philippe_Benard@hp.com [ HPS-SE HP-UX kernel=20
> debugging tools ]
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
