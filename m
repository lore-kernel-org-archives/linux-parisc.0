Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBSFZPa15384; Sun, 28 Dec 2003 10:35:25 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20031222213542.E2B3F4942A8@palinux.hppa>
References: <20031222213542.E2B3F4942A8@palinux.hppa>
Content-Type: text/plain
Date: 28 Dec 2003 09:35:24 -0600
Message-Id: <1072625725.1785.0.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 deller
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2003-12-22 at 15:35, Helge Deller wrote:
> - add special case for VIS EG in RDI Precisionbook Laptop - stifb does
> not yet support the framebuffer on the internal flatscreen display, so
> disable stifb support on this special device for now.

This change has disabled the framebuffer on my B180.  Now it prints

STI GSC/PCI core graphics driver Version 0.9a
STI word mode ROM at f0011000, hpa at f8000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1024
stifb: framebuffer support on internal RDI precisionbook flatscreen not
yet supported.

On boot.

James
