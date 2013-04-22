From: Graham Gower <graham.gower@gmail.com>
Subject: install medium for c8000 [was Re: PARISC Linux website and status update]
Date: Mon, 22 Apr 2013 22:42:48 +0930
Message-ID: <CAFk90B8ZNjwyWKpO_LhGPPkYB_sgJduMVi_YBCoN_Z6hk-_sFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20 April 2013 06:42, Helge Deller <deller@gmx.de> wrote:
> Hello everyone,
>
> During the last few days I've invested some time in updating our
> * main website at http://www.parisc-linux.org (including news-updates and favicon) and the
> * Wiki at http://wiki.parisc-linux.org
>
> As such, we now have some more current documentation about
> * http://wiki.parisc-linux.org/Debian_Ports_Installation  - How to install from Debian-Ports

Hi,

I'm wondering if there is an install iso with a kernel that has
CONFIG_PDC_CONSOLE=y, so that I can install on a c8000. (Or am I
missing something, is there a way to get it to work without this?)

Its kinda annoying if I've got to build a cross toolchain, cross
compile a kernel, tftpboot, nfsroot, etc. in order to put something on
the hard drive.

-Graham
