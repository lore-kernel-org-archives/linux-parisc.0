Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DB3148D7
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Aug 2003 13:01:03 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7FJ0wI02373;
	Fri, 15 Aug 2003 15:00:58 -0400
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build
	problem)
From: James Bottomley <James.Bottomley@steeleye.com>
To: James Bottomley <James.Bottomley@SteelEye.com>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1060971586.2322.213.camel@fuzzy>
References: <W9958529574305441060899998@webmail4>
	<20030815172142.GA19042@dsl2.external.hp.com>
	<1060971586.2322.213.camel@fuzzy>
Content-Type: text/plain
Date: 15 Aug 2003 14:00:57 -0500
Message-Id: <1060974059.3260.261.camel@fuzzy>
Mime-Version: 1.0
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

On Fri, 2003-08-15 at 13:19, James Bottomley wrote:
> I'll see if I can figure out how to set this up...the documentation
> appears to be a bit sparse [unless Alan has any hints].

OK, the way you do this is to start x and then type xdpyinfo.  As part
of a general list, it should give you all the visuals (including the one
it's picked as the default).

Then, you simply choose the TrueColor visual, count its index down from
the top (starting at zero---note, this isn't the visual id xdpyinfo
gives you) and then feed this back into startx:

startx -- -cc <visual index>

So on the B180, my visuals output looks like:

  number of visuals:    8
  default visual id:  0x29
  visual:
    visual id:    0x27
    class:    PseudoColor
    depth:    8 planes
    available colormap entries:    256
    red, green, blue masks:    0x0, 0x0, 0x0
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x28
    class:    GrayScale
    depth:    8 planes
    available colormap entries:    256
    red, green, blue masks:    0x0, 0x0, 0x0
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x29
    class:    StaticColor
    depth:    8 planes
    available colormap entries:    256
    red, green, blue masks:    0x7, 0x38, 0xc0
    significant bits in color specification:    8 bits
 [...]

So to get the StaticColor visual, I issue

startx -- -cc 2

The colours are slightly off, though (my white has now got a bluish
tinge, but I assume you can find a better visual than the one I chose).

James
