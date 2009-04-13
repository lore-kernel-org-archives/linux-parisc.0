From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: 2.6.30-rc1 hangs on boot
Date: Mon, 13 Apr 2009 14:26:33 +0000
Message-ID: <1239632793.3278.18.camel@mulgrave.int.hansenpartnership.com>
References: <20090411114219.GA14981@mayall.koti>
	 <20090413020626.GA13090@lackof.org>
	 <a4423d670904122053y7fb79af7tb29f324726e2c7e7@mail.gmail.com>
	 <20090413050418.GD13090@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Alexander Beregalov <a.beregalov@gmail.com>, jukka.taimisto@iki.fi,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090413050418.GD13090@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2009-04-12 at 23:04 -0600, Grant Grundler wrote:
> On Mon, Apr 13, 2009 at 07:53:39AM +0400, Alexander Beregalov wrote:
> > 2009/4/13 Grant Grundler <grundler@parisc-linux.org>:
> > > On Sat, Apr 11, 2009 at 02:42:19PM +0300, Jukka Taimisto wrote:
> > >> Hi,
> > >>
> > >> It seems that almost every other boot with 2.6.30-rc1 my HP c3700 with
> > >> single PA8700 (PCX-W2) 750MHz cpu hangs with following printed on serial
> > >> console:
> > >
> > > Another data point:
> > > I tried 2.6.30-rc1-b5 (UP, 64-bit) and that booted on "model 9000/785/J6000"
> > > both times that I tried. Config file is attached.
> > 
> > Hi Grant,
> > # CONFIG_64BIT is not set
> > in your config
> 
> Oopps....my bad. Sorry. That's obviously a 32-bit kernel.
> I must have checked uname output on the wrong machine. :(
> 
> thanks for catching that,
> grant

A 64 bit kernel definitely works for me on ion (a pa8900 box):

Linux ion 2.6.30-rc1 #2 SMP Sat Apr 11 08:57:03 PDT 2009 parisc64

The tg3 seems to be having some difficulty coming up, but it looks like
it's an eth device aliasing problem.

James


