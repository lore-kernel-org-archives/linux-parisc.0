Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EA134829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 06:32:32 -0600 (MDT)
Date: Fri, 30 Aug 2002 14:25:04 +0200
Message-ID: <3D3815BD000098F6@ocpmta5.be.tiscali.com>
In-Reply-To: <1030705659.3196.19.camel@irongate.swansea.linux.org.uk>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] GNOME 1.4
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: "Grant Grundler" <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>-- Original Message --
>Subject: Re: [parisc-linux] GNOME 1.4
>From: Alan Cox <alan@lxorguk.ukuu.org.uk>
>To: jsoe0708@tiscali.be
>Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
>   parisc-linux@lists.parisc-linux.org
>Date: 30 Aug 2002 12:07:39 +0100
>
>
>On Fri, 2002-08-30 at 07:02, jsoe0708@tiscali.be wrote:
>> I also appreciate xfce. Just need more than 8 colors but I read Alan Cox
>> mail about hp dither CR technic but do not really how to use this material.
>> I some one has already some draft code?
>
>For 8bit desktops just bang the icons through the pnmtools and quantize
>them to 16 colours. I do wish X had an RGB332 'truecolour' some times.
>
>That draft code tells you how to dither your images for the display. As
>far as I can make out its primarily aimed at 3D rendering, so you can
>have fake high quality 3D images (where 8bit banding _really_ ruins the
>display) at lower resolution than your desktop
>
Thanks, I definitely missunderstand the purpose of this code.

My actual question would be how to obtain 128 (and may be more) colors like
CDE or VUE (is X11R6 server like mklinux proposed would help?)


Joel
