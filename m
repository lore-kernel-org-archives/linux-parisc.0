From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Banshee and Voodoo2
Date: Mon, 10 Jan 2005 11:09:16 +0000
Message-ID: <1105313971.12028.55.camel@localhost.localdomain>
References: <Pine.BSO.4.61.0501081917230.2715@gate.helzinki.net>
	<200501091547.56765.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501091547.56765.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sul, 2005-01-09 at 20:47, Mike Frysinger wrote:
> ive actually hooked a voodoo2 into my C360 and got Xorg working at 
> 1024x768 ... i also tried the obsidian voodoo2 (it's basically 2 voodoo2's on 
> one card), but that kernel paniced (probably because of assumptions in the fb 
> code that there's only 1 voodoo2 per card ... ?)

It shouldn't panic. It may have bugs with multiple cards. Neither Xorg
nor the fb driver support the alternate scanline modes however.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
