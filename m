From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Banshee and Voodoo2
Date: Sun, 9 Jan 2005 15:47:56 -0500
Message-ID: <200501091547.56765.vapier@gentoo.org>
References: <Pine.BSO.4.61.0501081917230.2715@gate.helzinki.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.BSO.4.61.0501081917230.2715@gate.helzinki.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 08 January 2005 12:26 pm, Jyry Suuntala wrote:
> Does anyone know is this list the actual list of supported hardware? If
> so, does X work with Banshee and at what resolution? And the same
> questions apply for Voodoo2, too :)

ive actually hooked a voodoo2 into my C360 and got Xorg working at 
1024x768 ... i also tried the obsidian voodoo2 (it's basically 2 voodoo2's on 
one card), but that kernel paniced (probably because of assumptions in the fb 
code that there's only 1 voodoo2 per card ... ?)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
