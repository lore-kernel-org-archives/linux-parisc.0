From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: X11 doesn't work
Date: Sun, 19 Dec 2004 05:56:13 +0100
Message-ID: <20041219045613.1760gmx1@mx020.gmx.net>
Cc: parisc-linux@lists.parisc-linux.org
To: Dr Gavin Seddon <gavinseddon@blueyonder.co.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
Resent-Message-Id: <20041219045353.686B8298052@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 18, 2004 at 04:24:34PM +0000, Dr Gavin Seddon wrote:
> > 	http://www.parisc-linux.org/faq/graphics-howto.html
>
> I did as instructed.  After my penguin on boot I see 'stifb:unsupported
> gfx card'

Did you have two gfx cards installed?
If you only have one then like the driver says, it's not supported.
I thought the penguin on boot was an indicator the card was supported.

>  and when I startx I get 'AddScreen/ScreenInit failed for
> driver 0'.  Need I alter XF86Config-4 to a different monitor?  At the
> moment it is set to 'generic'.

The Section "Screen" will reference a "Device". The corresponding
Section "Device" should be where one indicates which device one meant.
I've never tried to to setup multiple cards and don't know what
card specifier looks like. I suppose it's either a /dev name or
a PCI device (same format as lspci provides).

Anyone else help with this?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
