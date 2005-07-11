From: Scott Edwards <supadupa@gmail.com>
Subject: Re: [parisc-linux] Infinite error message from SDC driver on install
Date: Mon, 11 Jul 2005 13:50:10 -0600
Message-ID: <a53adc46050711125033341185@mail.gmail.com>
References: <42CF1766.8030608@excelcia.org> <42D0468C.5010005@excelcia.org>
Reply-To: Scott Edwards <supadupa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42D0468C.5010005@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I also have a B132l workstation.  I see about 200 lines of that
message, and eventually it says timeout 52000ms (vague recolection)
and it stops.  I have noticed I'm unable to boot certian kernels.=20
I've had to boot from the cd, hop to a shell, mount the drive, and
install the right kernel.  All I recall is that it is the non smp
32bit 2.6 kernel.  I was only able to use the same kernel that's used
with the installer cd.

I've also reported this on
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D302238.

If it's related, you may want to add to my bug id.  I'll try to get
back to the list w/in the next day to provide more specifics.  Ever
since I was unable to use my pci scsi card combined with a mishap on
my tape drive, I've kinda given up for a small season.

Good luck,


Scott

On 7/9/05, Kurt Fitzner <kfitzner@excelcia.org> wrote:
> I have found that if I switch to a serial console that after a variable
> (from 1 to 50) number of "Transaction add failed" error messages that a
> timeout error would occur and no further transaction errors will occur.
> This allows me to install Debian.
>=20
> After installation if I continue to boot with a serial console then I
> can boot the Debian installation.  If I try to boot with the standard
> graphics console, however, I have a new problem with the SDC driver.
> During boot when the SDC driver initializes, it issues the following
> message:
>=20
> "HP SDC MLC: Registering the System Domain Controller's HIL MLC."
>=20
> After the above message, the kernel hangs and booting is not possible.
>=20
> I am at my wit's end with this one.  I would really appreciate any
> insight that could be offered.
>=20
> Regards,
>=20
>     Kurt Fitzner
>=20
> p.s. In case it is relevant, machine specs are as follows:
> HP 9000 B132L workstation
> 128 MB RAM
> Seagate 4.3GB drive on fwscsi.6.0
> Panasonic cdrom on sescsi.3.0
> No EISA or PCI cards installed.
>=20
> Kurt Fitzner wrote:
> > I have just recently attempted to install Debian 3.1 on an old B132L.  =
I
> > have managed to get the install CD to boot, but the kernel is issuing a=
n
> > infinite stream of error messages from the SDC driver:
> >
> > "HP SDC: Transaction add failed: transaction already queued?"
> >
> > At first this was preventing the install CD from booting.  I determined
> > this was due to syslogd filling the ramdisk by logging the above
> > message.  I was able to get the install CD to boot into the installatio=
n
> > by making the initial ramdisk size very large (64 meg).  However, even
> > this fills up withing a few minutes.
> >
> > I'm not very familliar with the SDC - is there a way to prevent the
> > above from occuring?
> >
> > Thanks in advance,
> >
> >       Kurt Fitzner
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
