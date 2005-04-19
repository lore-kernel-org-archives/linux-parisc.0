From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] A500: 2.4.18 64bit SMP Kernel Crash
Date: Tue, 19 Apr 2005 09:23:21 +0300
Message-ID: <20050419072321.7088C3658F2@mail.esiee.fr>
References: <20050419040631.GD19715@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050419040631.GD19715@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

-------------------
> > So, I installed the 2.4.18-hppa kernel sources, and built my own
kernel.
> > However, the box wouldn't boot that kernel; instead it'd crash
right after
> > the IPL part of PALO would try to load the kernel image.
> >=20
> > - I used the gcc-hppa64-3.0.4ds9-3-hppa.deb gcc compiler, along
with the
> > binutils-2.11.90.0.18-o.deb package off
> > ftp.parisc-linux.org/unofficial-debs to compile
>=20
> Can you try a prebuilt a500 kernel? Something from
> http://cvs.parisc-linux.org/download/linux-2.6/
>=20
> Perhaps:
>
http://cvs.parisc-linux.org/download/linux-2.6/autobuild/a500_defconfi
g/palinux-a500-defconfig-2.6.12-rc2-pa3_0-2_all.deb
>=20
> If you want to build it from source, I would suggest that you:
> - upgrade to "testing" from woody
> - install gcc-3.3-hppa64 and binutils-hppa64 (from Debian, not
>   from unofficial-debs)
> - Get the sources from
> =20
http://cvs.parisc-linux.org/download/linux-2.6/linux-2.6.12-rc2-pa3.ta
r.bz2
>=20
>   Or directly from cvs: http://www.parisc-linux.org/faq/cvs.html

Beware that it is likely that your SCSI devices will be renamed (eg
sda -> sdb)

--=20
Thibaut VARENE
Debian, Ubuntu and Kernel hacker
http://www.pateam.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
