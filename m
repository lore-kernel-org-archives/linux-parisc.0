Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 269404849
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 02:21:42 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Thomas Schmid" <Thomas.Schmid@ascom.ch>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems running KDE on PARISC
Date: Fri, 22 Feb 2002 10:21:39 +0100
References: <OF0A3B134F.4AC4EE69-ONC1256B68.002AD4A9@hasler.ascom.ch>
In-Reply-To: <OF0A3B134F.4AC4EE69-ONC1256B68.002AD4A9@hasler.ascom.ch>
MIME-Version: 1.0
Message-Id: <E16eBtb-00077l-00@linuxlab.wdf.sap-ag.de>
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

Hi Thomas,

You may try to remove/move away the libarts binaries and libraries 
(dpkg -L libarts).
They regulaty crash here for me too when running the KDE 3 CVS version.
This seems to be related to the fact that we still have issues
with threads on hppa.

Helge

On Friday 22 February 2002 10:07, Thomas Schmid wrote:
> Hi all,
>
> I do hope this is not off-topic, but I could not find a hint to my
> problem anywhere else.
>
> I'm running the 0.9.3 distribution on 2 PARISC machines:
> HP 712/80, 64MB RAM and HP 715/100XC, 256 MB RAM
>
> Generally speaking KDE is slow on these machines, but
> when I log in from KDM, it takes on _both_ machines about
> 4..5 minutes to go from KDM login screen to KDE window
> manager.
>
> Nothing fancy (wallpaper, fontaliasing, file preview) is enabled,
> just a 2 color gradiant background.
>
> What I can see from "top" is that the "kdeinit knotify" process
> uses up to 90% CPU for quite a long time; it also seems to run
> 3 times in a row. Memory usage is neglectable.
>
> When I finally "arrive" on the KDE desktop I get 3 SIGSEGV
> (KDE crashmanager) for the 3 "knotify"s plus an error dialog
> box saying: "The protocol for the file process died unexpectedly"
> (I guess it means that the kio_file process died, but after all that
> I have 1 kio_file process running)
>
> After that KDE is usable.
>
> Does anybody have similiar / better / worse experiences with
> KDE ?  Any hints what to improve ? Is the KDE package in a
> sub-optimal stage ?
>
> Thanks for any input
> Thomas
>
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Helge Deller
SAP AG - LinuxLab and Unix Platforms
email: helge.deller@sap.com
Phone: +49 6227 7 - 67783
