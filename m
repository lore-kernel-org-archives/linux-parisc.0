From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [parisc-linux] Re: Why toggle_bounce only for disks?
Date: Fri, 19 Aug 2005 12:07:44 +0200
Message-ID: <58cb370e05081903073d9a2b73__42746.015583589$1416623908$gmane$org@mail.gmail.com>
References: <20050806235615.GK3505@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: linux-ide@vger.kernel.org,
 Jens Axboe <axboe@suse.de>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050806235615.GK3505@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

http://www.ussg.iu.edu/hypermail/linux/kernel/0209.1/1074.html

Jens, is this still true??

Bartlomiej

On 8/7/05, Kyle McMartin <kyle@parisc-linux.org> wrote:
> Ahoi,
>=20
> The following patch fixes a crash caused by attempting to bounce buffer
> when an IDE CD-ROM is used on a machine with an IO-MMU. [At least, this
> patch fixes things so I can use my IDE CD-ROM behind an ns87415 on a
> HP PA-RISC workstation.]
>=20
> Why was this only allowed for disks?
>=20
> --- a/drivers/ide/ide-lib.c   18 Jul 2005 18:46:30 -0000
> +++ b/drivers/ide/ide-lib.c   6 Aug 2005 20:28:04 -0000
> @@ -410,7 +410,7 @@ void ide_toggle_bounce(ide_drive_t *driv
>  {
>         u64 addr =3D BLK_BOUNCE_HIGH;     /* dma64_addr_t */
>=20
> -       if (on && drive->media =3D=3D ide_disk) {
> +       if (on) {
>                 if (!PCI_DMA_BUS_IS_PHYS)
>                         addr =3D BLK_BOUNCE_ANY;
>                 else if (HWIF(drive)->pci_dev)
>=20
> Cheers,
> --
> Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
