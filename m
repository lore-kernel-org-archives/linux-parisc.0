Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc1-cwma1-5-cust128.swa.cable.ntl.com [80.5.120.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 399FD4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 05:07:31 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id g7UB7fEe003441;
	Fri, 30 Aug 2002 12:07:41 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id g7UB7d19003439;
	Fri, 30 Aug 2002 12:07:39 +0100
Subject: Re: [parisc-linux] GNOME 1.4
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: jsoe0708@tiscali.be
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D3815BD00009598@ocpmta5.be.tiscali.com>
References: <3D3815BD00009598@ocpmta5.be.tiscali.com>
Content-Type: text/plain
Date: 30 Aug 2002 12:07:39 +0100
Message-Id: <1030705659.3196.19.camel@irongate.swansea.linux.org.uk>
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

On Fri, 2002-08-30 at 07:02, jsoe0708@tiscali.be wrote:
> I also appreciate xfce. Just need more than 8 colors but I read Alan Cox
> mail about hp dither CR technic but do not really how to use this material.
> I some one has already some draft code?

For 8bit desktops just bang the icons through the pnmtools and quantize
them to 16 colours. I do wish X had an RGB332 'truecolour' some times.

That draft code tells you how to dither your images for the display. As
far as I can make out its primarily aimed at 3D rendering, so you can
have fake high quality 3D images (where 8bit banding _really_ ruins the
display) at lower resolution than your desktop
