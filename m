From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: [PATCH] missing exports
Date: Mon, 12 Jul 2004 00:16:03 +0200
Message-ID: <200407120016.03356.deller@gmx.de>
References: <1067288209.3591.1.camel@kars.perseus.home>
	<200407101555.18830.deller@gmx.de>
	<1089477389.2474.129.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Kars de Jong <jongk@linux-m68k.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1089477389.2474.129.camel@kars.perseus.home>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 10 July 2004 18:36, Kars de Jong wrote:
> It seems to be worse than 2.4 though. On my HP9000/425t the keyboard
> sometimes locks up for a while and then starts reacting again. The mouse
> gets detected but doesn't seem to generate any events on
> /dev/input/mice.

Yes. Same problem here on HPPA/2.6 as well.

> > Anyway, I would be happy to see any patches and merge them upstream.
> 
> OK, here they are. Nothing to fix the reliability issues though, I'm
> affraid.

I applied your changes to the PARISC CVS tree, but as long as the mouse isn't working I think it's a bad idea to merge it upstream.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
