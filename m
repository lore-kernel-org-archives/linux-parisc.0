Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (bay1-dav25.bay1.hotmail.com [65.54.244.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 668594834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 09:05:15 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Thibaut VARENE" <varenet@esiee.fr>,
	"trnepal" <trnepal@papuasia.org>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <200303120011.21354.trnepal@papuasia.org> <20030312095243.4324170a.varenet@esiee.fr>
Subject: Re: [parisc-linux] bootp/tftpd :(
Date: Wed, 12 Mar 2003 17:04:11 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <BAY1-DAV25AusVxONvz0001408a@hotmail.com>
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

Something like that used to be the default footer when receiving messages
from the JServ mailing list ;)

----- Original Message -----
From: "Thibaut VARENE" <varenet@esiee.fr>
To: "trnepal" <trnepal@papuasia.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, March 12, 2003 9:52 AM
Subject: Re: [parisc-linux] bootp/tftpd :(


> In your case 1) should be enough.
>
> -----
> This is a template message.
>
> 1) Read the PA-RISC/Linux Boot HOWTO
> http://pateam.esiee.fr/doc.html
>
> 2) Read the FAQ
> http://www.fr.parisc-linux.org/faq/
>
> 3) Read the parisc-linux mailing-list archive
> http://www.fr.parisc-linux.org/mailing-lists/
>
> 4) Check the Hardware Database
> http://hwdb.parisc-linux.org/
>
> 5) Check the supported machines list
> http://pateam.esiee.fr/list.html
>
> 6) Read the "HOWTO Report a Kernel Bug"
> http://www.fr.parisc-linux.org/faq/kernelbug-howto.html
>
> 7) Read the "HOWTO Build a PA-RISC/Linux Kernel"
> http://www.fr.parisc-linux.org/kernel/
>
> ----
> That template may grow as some questions will reappear :P
>
>
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>
>
> On Wed, 12 Mar 2003 00:11:21 +0100
> "trnepal" <trnepal@papuasia.org> wrote:
>
> >
> >
> > hi all,
> >
> > im trying the lifimage 2.4.20-pa18-200301 from the esiee.fr pa team with
> > a 712/60 and a debian linux woody stable as as bootp/tftpd boot server.
> >
> > inetd.conf:
> > bootps          dgram   udp     wait    root    /usr/sbin/bootpd
 bootpd -i -t
> > 120
> > tftp    dgram   udp     wait    root    /usr/sbin/tcpd
/usr/sbin/in.tftpd
> > /tftpboot
> >
> >
> > the bootptab entry:
> >
pa:tc=allhost:ht=ether:bf=lifimage.img:hd=/tftpboot:ha=080009C9A102:ip=10.0.
0.12:to=7200
> >
> >
> > BOOT_ADMIN> boot lan .. and nothing happens :)
> >
> >
> > my syslog:
> > Mar 12 00:04:17 vivaio in.tftpd[786]: connect from 10.0.0.12
> > Mar 12 00:04:17 vivaio tftpd[787]: tftpd: trying to get file:
> > /tftpboot/lifimage.img
> >
> > and tcpdump ..
> > tcpdump: listening on eth0
> > 00:05:39.631149 10.0.0.11.bootps > 10.0.0.12.bootpc:  xid:0x420b596a
> > Y:10.0.0.12 S:10.0.0.11 sname "vivaio" [|bootp] (DF)
> > 00:05:39.970369 10.0.0.12.51998 > 10.0.0.11.tftp:  516 RRQ
> > "/tftpboot/lifimage.img" [tos 0x10]
> > 00:05:40.024953 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
> > 00:05:40.026317 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
> > 00:05:40.026458 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
> > 00:05:40.027593 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
> > 00:05:40.027701 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
> > 00:05:40.028837 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
> > 00:05:40.028940 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
> >
> >
> > sigh :((
> >
> > any clues? thanks in advance.
> > seeyouu byee.,'
> >
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
