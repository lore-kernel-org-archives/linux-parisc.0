Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 273A34852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Dec 2003 10:01:51 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 deller
Date: Sun, 28 Dec 2003 18:01:41 +0100
References: <20031222213542.E2B3F4942A8@palinux.hppa>
	<1072625725.1785.0.camel@mulgrave>
In-Reply-To: <1072625725.1785.0.camel@mulgrave>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200312281801.41466.deller@gmx.de>
Cc: James Bottomley <James.Bottomley@steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 28 December 2003 16:35, James Bottomley wrote:
> On Mon, 2003-12-22 at 15:35, Helge Deller wrote:
> > - add special case for VIS EG in RDI Precisionbook Laptop - stifb does
> > not yet support the framebuffer on the internal flatscreen display, so
> > disable stifb support on this special device for now.
> 
> This change has disabled the framebuffer on my B180.  Now it prints
> 
> STI GSC/PCI core graphics driver Version 0.9a
> STI word mode ROM at f0011000, hpa at f8000000
> STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
> STI device: INTERNAL_EG_1024
> stifb: framebuffer support on internal RDI precisionbook flatscreen not
> yet supported.
> 
> On boot.

Please update again. I reverted that change some minutes after my 
first commit.

Helge
