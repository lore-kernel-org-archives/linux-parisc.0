From: Michiel Broek <mbroek@mbse.dds.nl>
Subject: Re: [parisc-linux] [RE:] Installation Prolblem on model 712
Date: Fri, 4 Mar 2005 21:04:08 +0100
Message-ID: <200503042104.08973.mbroek@mbse.dds.nl>
References: <20050304112112.57017.qmail@web26809.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050304112112.57017.qmail@web26809.mail.ukl.yahoo.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Op vrijdag 4 maart 2005 12:21, schreef =CE=9C=CE=AC=CF=81=CE=B9=CE=BF=CF=82=
 =CE=9A.:
> This is my dmesg output
>
> The model is 712-60 and not 612
>
> I am begging to suspect the error vomes from the cd-rom
>
> It is a very old cd-rom.
>
> The cd i burned it is good quality and have been written in 4x speed

> Attached SCSI CD-ROM sr0 at scsi0, channel 0, id 5 lun 0
>
> sr0: scsi-1 drive

I think your CD drive is too old. I used to have some old single speed HP=20
readers that didn't work with self burned CD's. Youre drive reports scsi-1=
=20
but I think the 712 needs scsi-2 equipment, but I'm not sure about that.


The one I now use reports this:

sr0: scsi3-mmc drive: 0x/0x caddy
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 4, lun 0

I'm using this on a 712/80 with a 2.6.10-pa11 kernel.=20

=2D-=20

 Greetings, Michiel Broek

mbroek@mbse.dds.nl  or  Fidonet 2:280/2802 to Michiel Broek.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
