From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.30-rc1 hangs on boot
Date: Sun, 12 Apr 2009 23:04:18 -0600
Message-ID: <20090413050418.GD13090@lackof.org>
References: <20090411114219.GA14981@mayall.koti> <20090413020626.GA13090@lackof.org> <a4423d670904122053y7fb79af7tb29f324726e2c7e7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>, jukka.taimisto@iki.fi,
	linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670904122053y7fb79af7tb29f324726e2c7e7@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 13, 2009 at 07:53:39AM +0400, Alexander Beregalov wrote:
> 2009/4/13 Grant Grundler <grundler@parisc-linux.org>:
> > On Sat, Apr 11, 2009 at 02:42:19PM +0300, Jukka Taimisto wrote:
> >> Hi,
> >>
> >> It seems that almost every other boot with 2.6.30-rc1 my HP c3700 with
> >> single PA8700 (PCX-W2) 750MHz cpu hangs with following printed on serial
> >> console:
> >
> > Another data point:
> > I tried 2.6.30-rc1-b5 (UP, 64-bit) and that booted on "model 9000/785/J6000"
> > both times that I tried. Config file is attached.
> 
> Hi Grant,
> # CONFIG_64BIT is not set
> in your config

Oopps....my bad. Sorry. That's obviously a 32-bit kernel.
I must have checked uname output on the wrong machine. :(

thanks for catching that,
grant

