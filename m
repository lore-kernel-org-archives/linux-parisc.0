Return-Path: <JKonrad@linotype.com>
Received: from mail.linotype.com (unknown [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id D18CF482A
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 08:22:22 -0600 (MDT)
To: paczkoa@naturland.hu
Message-ID: <OFE1F8BAC7.195054B9-ONC1256E70.004EA0DA@fonts.de>
From: JKonrad@linotype.com
Date: Thu, 8 Apr 2004 16:21:01 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Antwort: HP9000 K Class install howto
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hi,

was an error while unpacking the kernel. Unpacked it a second time - no=
w the machine works. Thanks very much!!!!!

Unfortunately, it is not an smp-kernel, but nevertheless, the machine w=
orks!! Your howto is brilliant, the people should put this into officia=
l usage.

Greetings,

Jay


                                                                       =
                                                                       =
        =20
                      Paczk=F3 Andr=E1s                                =
                                                                       =
            =20
                      <paczkoa@naturlan        An:       JKonrad@linoty=
pe.com                                                                 =
        =20
                      d.hu>                    Kopie:                  =
                                                                       =
        =20
                                               Thema:    HP9000 K Class=
 install howto                                                         =
        =20
                      08.04.2004 10:12                                 =
                                                                       =
        =20
                      Bitte antworten                                  =
                                                                       =
        =20
                      an paczkoa                                       =
                                                                       =
        =20
                                                                       =
                                                                       =
        =20
                                                                       =
                                                                       =
        =20




HI!

I am install debian wtih a k260 and k460 with this howto. it is work pe=
rfekt.

> I worked on this for a while and finally developed a fairly trivial
> recipe to get debian woody installed on the K460 using the latest
> netinstall iso. =A0[Note: The K is not well supported on the 2.4 kern=
el,
> it is better supported under the 2.6 kernel ... It could work well fo=
r
> you ... depends upon what you are planning to use it for.]
>
> I performed this install using:
> =A0=A0=A0=A0=A0=A0palinux-2.4.22-pa6-20030903-netinst.iso
>
> But any of the net-install iso images should work.
>
> The only semi-gottcha is if you are setup to compile your own kernel
> from the cvs tree? =A0The problem is that linux-2.4.22-pa6 used by th=
e
> installer supports the Serial Mux console ... The kernel installed by=

> debian woody (2.4.17) does not. =A0This is why you would see past tho=
se
> last lines. =A0The recipe I developed to fix this prolem simply insta=
lls a
> newer kernel on the box so the Serial Mux console works.
>
> If you are not setup to compile I have made the kernel I used availab=
le
> at:
> =A0=A0=A0=A0=A0=A0http://parisc-linux.org/~rbrad/vmlinux-2.4.23-pa3.b=
z2
>
>
> Here is the receipe (could posibly be simpler.. but I verified this
> works on my k460):
>
> 1. Install ...
> =A0 =A0 =A0 =A0 Perform the install ... (do not reboot)
>
> 2. Execute the base-config ....
> =A0 =A0 =A0 =A0 execute a shell
> =A0 =A0 =A0 =A0 chroot /target
> =A0 =A0 =A0 =A0 mount -t proc proc /proc
> =A0 =A0 =A0 =A0 /usr/sbin/base-config
>
> 3. Load a newer kernel ...
> =A0 =A0 =A0 =A0 apt-get install wget
> =A0 =A0 =A0 =A0 wget http://somewhere.come/vmlinux-2.4.23-pa3
> =A0=A0=A0=A0=A0=A0ln -s /boot/vmlinux-2.4.23-pa3 /boot/vmlinux
> =A0 =A0 =A0 =A0 palo
>
> 4. Change the /dev/ttyB0 device file (it got assigned a real number
> since woody was released):
>
> =A0 =A0 =A0 =A0 rm /dev/ttyB0
> =A0 =A0 =A0 =A0 mknod /dev/ttyB0 c 11 0
> =A0 =A0 =A0 =A0 chgrp dialout /dev/ttyB0
> =A0 =A0 =A0 =A0 chmod 660 /dev/ttyB0
>
> 4. Cleanup the chroot...
> =A0 =A0 =A0 =A0 umount /proc
> =A0 =A0 =A0 =A0 exit # leave the chroot
>
> 5. Exit back to the installer ...
> =A0=A0=A0=A0=A0=A0exit # Go back to the installer.
> =A0 =A0 =A0 =A0 Reboot the system.
>
> Hope this helps you. =A0I am heading off to bed now... so let me know=
 if
> you have any additional problems or questions, I will try to help out=

> some more tomorrow!
>
> Thanks,

best,

--
Paczk=F3 Andr=E1s
rendszergazda

Naturland Magyarosz=E1g Kft.
+36 (06-1) 431-2092
paczkoa@naturland.hu
ICQ: 178003397






=
