Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id B176F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:23:44 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <OFDA82DE64.7D19042A-ONC1256A9D.00225C6C@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Fri, 3 Aug 2001 12:26:19 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] XFree86, Gnome on 712/80
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

To test Xfree86, I install following packages:

xserver-xfree86_4.0.3-4_hppa.deb
xserver-common_4.0.3-4_hppa.deb
xterm_4.0.3-4_hppa.deb
xlibmesa3_4.0.3-4_hppa.deb
xlib6g_4.0.3-4_all.deb
xfree86-common_4.0.3-4_all.deb
xfonts-scalable_4.0.3-4_all.deb
xfonts-base_4.0.3-4_all.deb
xfonts-75dpi_4.0.3-4_all.deb
xfonts-100dpi_4.0.3-4_all.deb
xlibs_4.0.3-4_hppa.deb
libxaw7_4.0.3-4_hppa.deb
libfreetype6_2.0.2.20010514-1_hppa.deb
xdm_4.0.3-4_hppa.deb
xbase-clients_4.0.3-4_hppa.deb
libxaw6_4.0.3-4_hppa.deb
xutils_4.0.3-4_hppa.deb

On the 712/80 it seems to works now with XF86config file which Thomas
Bogendoerfer used in:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012928.html

(I just had to change "repeat_type=ms3" to  "repeat_type=" in /etc/gpm.conf
to make mouse working correctly)

Following this success, I would go further and try to start gnome and so
install following packages:
gnome-help_1.4.0.4-6_hppa.deb
gnome-core_1.4.0.4-6_hppa.deb
gnome-panel_1.4.0.4-6_hppa.deb
gnome-session_1.4.0.4-6_hppa.deb
gnome-terminal_1.4.0.4-6_hppa.deb
gnome-utils_1.4.0.2-2_hppa.deb
gnome-panel-data_1.4.0.4-6_all.deb
gnome-bin_1.2.13-9_hppa.deb
gnome-libs-data_1.2.13-9_all.deb
imlib1_1.9.10-5_hppa.deb
imlib-base_1.9.10-5_all.deb
libjpeg62_6b-1.3_hppa.deb
libpng2_1.0.12-2_hppa.deb
libtiff3g_3.5.5-5_hppa.deb
libungif4g_4.1-9_hppa.deb
libc6_2.2.3-9_hppa.deb
scrollkeeper_0.2-5_hppa.deb
libscrollkeeper0_0.2-5_hppa.deb
libxml1_1.8.14-4_hppa.deb
libgtk1.2_1.2.10-1_hppa.deb
libgnorba27_1.2.13-9_hppa.deb
libgnomeui32_1.2.13-9_hppa.deb
libgnorbagtk0_1.2.13-9_hppa.deb
libgnorba27_1.2.13-9_hppa.deb
liborbit0_0.5.8-2_hppa.deb
libesd0_0.2.22-6_hppa.deb
libesd-alsa0_0.2.22-6_hppa.deb
libaudiofile0_0.2.2-1_hppa.deb
libesd-alsa0_0.2.22-6_hppa.deb
libaudiofile0_0.2.2-1_hppa.deb
libasound1_0.5.10-2.1_hppa.deb
esound-common_0.2.22-6_all.deb
libgnomesupport0_1.2.13-9_hppa.deb
libcapplet0_1.4.0.1-11_hppa.deb
libgdk-pixbuf2_0.11.0-2_hppa.deb
libgnome32_1.2.13-9_hppa.deb
libpanel-applet0_1.4.0.4-6_hppa.deb
libbz2-1.0_1.0.1-12_hppa.deb
libgnome32_1.2.13-9_hppa.deb
libgtkxmhtml1_1.2.13-9_hppa.deb
libgdk-pixbuf-gnome2_0.11.0-2_hppa.deb
libzvt2_1.2.13-9_hppa.deb
libglade0_0.16-4_hppa.deb
libglade-gnome0_0.16-4_hppa.deb
libgtop1_1.0.12-2.2_hppa.deb
gdm_2.2.3.1-2_hppa.deb

And this gdm failled to start?
in /var/log/daemon.log: ...gdm[..]: Failed to start the display server
several times in a short time period; disable display :0

I well see the server trying restart severall time but without other error
logged elsewhere? Any idea (about the problem or how to log more)?

Against, if I remove only gdm and re-install xdm, I got well xdm login
screen but when I try to login with my user account it failed but I got
severall errors:

1) in auth.log:
    PAM unable to dlopen(/lib/security/pam_condev.so)
    PAM [dlerror: /lib/security/pam_condev.so: cannot open shared object
file: No such file or directory]
    PAM adding faulty module: /lib/security/pam_condev.so

Note:
/lib/security/pam_condev.so is not really installed on the system.
On http://www.debian.org/distrib/packages I try to find which package could
supply it but
"Debian package contents search results

FILE                                                       PACKAGE

No responses to your query."


2) in xdm.log:
rm: cannot remove '/var/run/xconsole:0.pid': No such file or directory
ioctl FBIOPAN_DISPLAY: Invalid argument
PEXExtensionInit: Couldn't open default PEX font file  Roman_M

Note:
/var/run/xconsole:0.pid does not exist but well /var/run/xconsole.:0.pid
(additional dot between e and :)


Thanks in advance for all advises,
     Joel

PS: I got the same problem as well as with 2.4.6-pa22 (20010801) as
2.4.7-pa1 (20010802)




**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
