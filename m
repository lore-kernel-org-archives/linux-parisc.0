Return-Path: <varenet@esiee.fr>
Received: from mail.zigoo.net (d050.dhcp212-198-139.noos.fr [212.198.139.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id E142F4854
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 18:21:02 -0700 (MST)
Date: Wed, 24 Dec 2003 02:20:51 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Compiling Kernel for HP 9000/800/A400-44
Message-Id: <20031224022051.15bf7d58.varenet@esiee.fr>
In-Reply-To: <3FB265250001889E@ocpmta2.freegates.net>
References: <20031219200236.GA18747@MAIL.13thfloor.at>
	<3FB265250001889E@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 23 Dec 2003 19:37:09 +0100
"Joel Soete" <soete.joel@tiscali.be> wrote:

> Hi Grant, Herbert,
> 
> > >
> > >>You'll need to grab the gcc-hppa64 compiler from:	
> > >>    
> > >>ftp://ftp.parisc-linux.org/unoffocial-debs/gcc-hppa64_3.0.4ds3- 
> > >>7.1_hppa.deb
> > >
> This failled to me:
> /usr/bin/hppa64-linux-ld: line 4: 10920 Segmentation fault     
> /opt/palinux/bin/$prog$*
> make: *** [.tmp_vmlinux1] Error 139
> "
> A well know pb which required a new release iirc.

I'd say it just requires you to disable KALLSYMS in your 64bit kernel
conf.


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/
On vacation till Jan 6.
