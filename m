From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Fri, 7 Jan 2005 10:48:11 +0100
Message-ID: <41C968020000397C@mail-3-bnl.tiscali.it>
References: <41C9680200003964@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Ben Fisher" <bfisher@intech-intl.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41C9680200003964@mail-3-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Ben, 

Because of following pb:
> The following message to  was undeliverable.
> The reason for the problem:
> 5.1.0 - Unknown address error 554-'Service unavailable; Client host [21=
3.205.37.211]
blocked using bl.spamcop.net;  Blocked - see http://www.spamcop.net/bl.sh=
tml?213.205.37.211'
>
> Final-Recipient: rfc822;bfisher@intech-intl.com
>Action: failed
> Status: 5.0.0 (permanent failure)
> Diagnostic-Code: smtp; 5.1.0 - Unknown address error 554-'Service unava=
ilable;
Client host [213.205.37.211] blocked > using bl.spamcop.net; Blocked - se=
e
http://www.spamcop.net/bl.shtml?213.205.37.211' (delivery attempts: 0)
> Reporting-MTA: dns; mail-r3.tiscali.it

I resent you my notice via p-l :-)
> -- Original Message --
> Date: Fri, 7 Jan 2005 10:25:26 +0100
> From: "Joel Soete" <soete.joel@tiscali.be>
> Subject: RE: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troub=
les
> To: "Ben Fisher" <bfisher@intech-intl.com>
> 
> 
> Hello Ben,
> 
> >
> > To eliminate other possibilities, I re-partitioned my disk according
to
> the
> > install manual (all primary) and started over.
> Cool (good idea :-)
> 
> >  After a few issues with
> > kernel compilation (I could not get the 64 bit version to work at all=
!
> -
> > no
> > hppa 64 bit gcc compiler, or something like that), I copied the compi=
led
> > kernel to the /boot directory, as well as everything else the guide
> > recommends.  After modifying the /etc/palo.conf file and running:
> >
> > # palo
> >
> > I get the following result:
> >
> > Palo version 1.2 root@LiveCD Wen Jan 5 21:35:19 EST 2005
> Oops '1.2 version'  now 1.5 (I do vaguely remember of an issue for 9Gb
disk
> but I don't remember exactly when it was fixed)
> It could be a good idea to ask also to build new LiveCd with this newer=

> palo?
> 
> > Partition Start (MB)  End (MB)   	ID   	Type
> > 1		1	16	f0	Palo
> > 2		17	78	83	EXT2
> > 3		79	1033	82	SWAP
> > 4		1034	8678	83	EXT2
> > IPL: ADDR 16384  Size 34816 Entry 0x0
> > Ko 0x0 ksz 0 k640 0x0 k64sz 0 rdo 0 rdsz 0
> > <2/kernel-2.6.7 ROOT=3D/dev/sda4 HOME=3D/>
> > IPL: ADDR 16384  Size 34816 Entry 0x0
> > Ko 0x0 ksz 0 k640 0x0 k64sz 0 rdo 0 rdsz 0
> > <2/kernel-2.6.7 ROOT=3D/dev/sda4 HOME=3D/>
> >
> Look good to me too
> 
> > I get the same thing after re-emerging palo, in hopes that something
was
> > installed wrong.
> >
> > After exiting, unmounting, and rebooting, I still get the same messag=
e:
> >
> > IPL error:  Bad LIF Magic
> >
> ???
> Excepted a bug of which I don't remember in palo, the only other possib=
ilty
> I can see is  that in fact you have 2 disk in your system?
> Linux using sda as the one at scsi id 5 and sdb the scsi id 6 palo woul=
d
> so now be installed on sda (id 5 );
> while in general for hp ux it is usual to choose as primary boot disk
the
> one at scsi id 6 (where alway stand hpux ipl but the rest of OS removed=
).
> 
> A way to verify would be to interupt the auto boot:
> Main Menu: sea ipl
> 
> would show your boot devices?
> 
Hth,
     Joel


-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
