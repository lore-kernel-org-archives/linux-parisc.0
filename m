Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.cp.tin.it (vsmtp3.tin.it [212.216.176.223])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDCFA4834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 10:57:11 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: trnepal <trnepal@papuasia.org>
To: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] bootp/tftpd :(
Date: Thu, 13 Mar 2003 19:04:16 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <EE611482-5545-11D7-A259-0030656F07A2@esiee.fr>
In-Reply-To: <EE611482-5545-11D7-A259-0030656F07A2@esiee.fr>
MIME-Version: 1.0
Message-Id: <200303131904.16471.trnepal@papuasia.org>
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

On Thursday 13 March 2003 12:21, Thibaut VARENE wrote:

> obviously you still haven't found the "Reply All" command in your mail
> client.

mm, eheh. again i replied only to you cause i thought it was not
a stuff that matters for the list .. anyway now im writing to all:
(probably annoying someone :)

>
> bad configuration in inetd and/or bad request from the client?

i dont know .. anyway my inetd was right, a standard one as i read
in your faq. i posted it in my first post. i cant control the client beha=
viour=20
(or im unable to :) ..

my bootptab,

pa:ht=3Dether:bf=3Dlifimage:hd=3D/tftpboot/:ha=3D080009C9A102:ip=3D10.0.0=
=2E12:sm=3D255.255.255.0

my inetd.conf,

tftp    dgram   udp     wait    root    /usr/sbin/tcpd  /usr/sbin/in.tftp=
d=20
/tftpboot

i used to launch bootpd -d9 so i dont have a bootpd inetd entry.

this is a successfull boot:

Mar 12 23:46:27 vivaio bootpd[867]: found 10.0.0.12 (pa)
Mar 12 23:46:27 vivaio bootpd[867]: bootfile=3D"/tftpboot//lifimage"

this in a unsuccessfull boot:

Mar 12 16:39:37 vivaio in.tftpd[544]: connect from 10.0.0.12
Mar 12 16:39:37 vivaio tftpd[545]: tftpd: trying to get file:=20
/tftboot/lifimage

> still I can't help without output.

mm, i see. anyway i got those errors only with the ext cdrom
(a sony drive in a cool apple cd300 chassis :) .. so all was probably due=
 to=20
the cdrom. but with no errors the lifimage (the newest i found, 09march) =
was=20
unable to write the filesystem to the disk.

> dead hard drive?

mm i was able to run a badblocks check and i wrote a filesystem
with another machine (debian/intel) before trying the good (for me) lifim=
age=20
=2E. anyway now it rocks. probably it was a software failure i cant track=
 down=20
(maybe a borderline dead drive, maybe it will be dead tomorrow :).

> cool.

sure. my little 712/60 is now playing mp3 from its internal
speaker. and im happy :)).=20

> relax: watch a game, have a beer... True.

eheh, okk. thankyou. byee.'
