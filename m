From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] Install problem Debian 3.0.23 L1000-36
Date: Tue, 15 Jun 2004 09:23:49 +0300
Message-ID: <20040615072350.5267A3658B6@mail.esiee.fr>
References: <OFCD849C44.4ED10052-ONC2256EB4.002423AB-C2256EB4.0024472D@cssdom.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Harri.Huttula@outokumpu.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <OFCD849C44.4ED10052-ONC2256EB4.002423AB-C2256EB4.0024472D@cssdom.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

L1000-36 works just fine

read the HOWTO here:
http://www.pateam.org/doc.html

and use a netinst ISO:
http://www.pateam.org/download.html

HTH,


Thibaut VARENE
PA/Linux ESIEE Team
http://www.pateam.org/


-------------------
> Hi,=20
>=20
> First of all I am newbie for PA-RISC Linux. Now I am trying to
install=20
> Debian 3.0.23 to our old HP server(model L1000-36) with no success.
This=20
> is what I have accomplished so far:=20
>=20
> - set 700/96 console so that i can actual start installing :)
(couldn't=20
> get serial console working with RS-232 and win2k hyperterminal,
though)=20
> - CD boots OK=20
>=20
> Problems start when I try to "Install the Base System".=20
>=20
> Following warning occurs:=20
>=20
> Failure trying to run: chroot /target dpkg --force-depends --install

> /var/cache/apt/archives/base-files_3.0.2_hppa.dep=20
> /var/cache/apt/archives/base_passwd_3.4.1_hppa.dep=20
>=20
> Followed by error:=20
>=20
> debootstrap exited with error( return value 1 )=20
>=20
> I have trackdown The Net and found that it might be SCSI
driver/controller=20
> problem that you have to give some SCSI related parameters to PALO.
My=20
> system has Symbios Logic 53c875 and 53c896 Ultra Wide SCSI.=20
>=20
> Anyone knows the solution?=20
>=20
> - Harri=20
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
