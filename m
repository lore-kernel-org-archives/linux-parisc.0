Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "JOERGENSEN,RUNAR (HP-Norway,ex1)" <runar_joergensen@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Startup problem X 
In-Reply-To: Message from "JOERGENSEN,RUNAR (HP-Norway,ex1)" <runar_joergensen@hp.com>
   of "Mon, 17 Dec 2001 19:37:23 +0100." <CDB09D386161D411881900D0B77FBBC106521DA2@ibsen.sweden.hp.com>
References: <CDB09D386161D411881900D0B77FBBC106521DA2@ibsen.sweden.hp.com> 
Date: Tue, 18 Dec 2001 12:24:17 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011218192417.2B577482A@dsl2.external.hp.com>
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

"JOERGENSEN,RUNAR (HP-Norway,ex1)" wrote:
> I'm having X startup problems with a C200 (Raven/U+)
...
> about: FBIOPUT_VSCREENINFO: invalid argument
> AddScreen/ScreenInit failed for driver 0
...
> XFree86 version: 4.1.0.1
> OS: Linux 2.4.9-pa79 parisc64 [ELF] 

Try a 32-bit kernel.
64-bit kernel might want an ioctl "wrapper" which hasn't been written.
Newer kernels are available on ftp://ftp.parisc-linux.org/kernels/32

grant
