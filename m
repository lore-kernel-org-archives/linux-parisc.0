Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] GNOME 1.4 
In-Reply-To: Message from Alan Cox <alan@lxorguk.ukuu.org.uk>
   of "30 Aug 2002 12:04:37 BST." <1030705477.3180.15.camel@irongate.swansea.linux.org.uk>
References: <1nismusojam12vial5vnqarbmfd8pb8mh7@4ax.com> <20020830040829.3BE694829@dsl2.external.hp.com>  <1030705477.3180.15.camel@irongate.swansea.linux.org.uk> 
Date: Sun, 08 Sep 2002 15:56:02 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020908215602.791B0482A@dsl2.external.hp.com>
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

Alan Cox wrote:
> The setup I use so I get a 'real desktop' not just old style X window
> mangler is xfce for the desktop with the rox filer on top for the file
> mangler, icon dock etc.

rox filer isn't available pre-built for hppa.
"dpkg-buildpackage -rfakeroot -uc -us" died with:
...
checking that libgtk2.0-dev (version >= 2.0.1) is installed... no
configure: error: Package is not installed

while on my system "dpkg -l libgtk\*" says:
...
ii  libgtk2.0-0    2.0.2-5woody1  The GTK+ graphical user interface library
ii  libgtk2.0-comm 2.0.2-5woody1  Common files for the GTK+ graphical user int
ii  libgtk2.0-dbg  2.0.2-5woody1  The GTK+ libraries and debugging symbols
ii  libgtk2.0-dev  2.0.2-5woody1  Development files for the GTK+ library.

Latest source depot's are below in case someone wants to beat rox config
tools into submission:
deb http://www.janw.easynet.be/rox/ developer/
deb-src http://www.janw.easynet.be/rox/ developer/

(one might try "stable/" instead of "developer/")


> I'd guess it would be very nice on an ancient parisc box too because
> they pa boxes probably have better I/O

I was thinking xfce is a window manager but it's not:
    xfce is an easy-to-use and easy-to-configure toolbar for X11.  Features
    pulldown menus with color icons, 3D widgets,  etc.   It's  designed  to
    work with XFwm, (window manager shipped with xfce)

It works on fine on my B180...but I didn't try it with XFwm as reccomended.
fvwm was still running...I'll try it again with XFwm.

thanks,
grant
