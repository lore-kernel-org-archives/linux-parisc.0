Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.cp.tin.it (vsmtp3.tin.it [212.216.176.223])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6CF34830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 16:04:34 -0700 (MST)
Received: from vaiom (80.117.31.93) by smtp3.cp.tin.it (6.5.033)
        id 3E48CE9F00B1ADBF for parisc-linux@lists.parisc-linux.org; Wed, 12 Mar 2003 00:04:31 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: trnepal <trnepal@papuasia.org>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 12 Mar 2003 00:11:21 +0100
MIME-Version: 1.0
Message-Id: <200303120011.21354.trnepal@papuasia.org>
Subject: [parisc-linux] bootp/tftpd :(
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


hi all,

im trying the lifimage 2.4.20-pa18-200301 from the esiee.fr pa team with
a 712/60 and a debian linux woody stable as as bootp/tftpd boot server.

inetd.conf:
bootps          dgram   udp     wait    root    /usr/sbin/bootpd  bootpd =
-i -t=20
120
tftp    dgram   udp     wait    root    /usr/sbin/tcpd  /usr/sbin/in.tftp=
d=20
/tftpboot


the bootptab entry:
pa:tc=3Dallhost:ht=3Dether:bf=3Dlifimage.img:hd=3D/tftpboot:ha=3D080009C9=
A102:ip=3D10.0.0.12:to=3D7200


BOOT_ADMIN> boot lan .. and nothing happens :)


my syslog:
Mar 12 00:04:17 vivaio in.tftpd[786]: connect from 10.0.0.12
Mar 12 00:04:17 vivaio tftpd[787]: tftpd: trying to get file:=20
/tftpboot/lifimage.img

and tcpdump ..
tcpdump: listening on eth0
00:05:39.631149 10.0.0.11.bootps > 10.0.0.12.bootpc:  xid:0x420b596a=20
Y:10.0.0.12 S:10.0.0.11 sname "vivaio" [|bootp] (DF)
00:05:39.970369 10.0.0.12.51998 > 10.0.0.11.tftp:  516 RRQ=20
"/tftpboot/lifimage.img" [tos 0x10]
00:05:40.024953 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
00:05:40.026317 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
00:05:40.026458 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
00:05:40.027593 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
00:05:40.027701 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)
00:05:40.028837 10.0.0.12.51998 > 10.0.0.11.1048:  udp 4 [tos 0x10]
00:05:40.028940 10.0.0.11.1048 > 10.0.0.12.51998:  udp 516 (DF)


sigh :((

any clues? thanks in advance.
seeyouu byee.,'
