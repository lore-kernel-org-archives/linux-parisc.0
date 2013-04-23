From: Graham Gower <graham.gower@gmail.com>
Subject: Re: install medium for c8000 [was Re: PARISC Linux website and status update]
Date: Tue, 23 Apr 2013 09:32:57 +0930
Message-ID: <CAFk90B_rakTmEWv7RagoOAv7dybZKA_POvrb4MDYCEF9FOO6JA@mail.gmail.com>
References: <CAFk90B8ZNjwyWKpO_LhGPPkYB_sgJduMVi_YBCoN_Z6hk-_sFQ@mail.gmail.com>
	<0d62eecac81e83ba969f27e280554c19.squirrel@mail.therion.be>
	<2146001.U3u6lFCtbY@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2146001.U3u6lFCtbY@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 23 April 2013 01:47, Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> Am Montag 22 April 2013, 17:00:07 schrieb Geert Lorang:
>> On Mon, April 22, 2013 15:12, Graham Gower wrote:
>> > I'm wondering if there is an install iso with a kernel that has
>> > CONFIG_PDC_CONSOLE=y, so that I can install on a c8000. (Or am I
>> > missing something, is there a way to get it to work without this?)
>> >
>> > Its kinda annoying if I've got to build a cross toolchain, cross
>> > compile a kernel, tftpboot, nfsroot, etc. in order to put something on the
>> > hard drive.
>>
>> AFAIK the C8000s have unsupported serial ports / network card.
>
> The network card is an e1000, which has a somewhat weird "checksum" for the
> EEPROM. In newer kernels the driver knows how to handle that. For older
> kernels you need to set the MAC by hand, but otherwise everything is fine.
>
> About the serial I'm not absolutely sure, but I think it worked. The only
> thing I needed to change was to set the console to ttyB0 instead of ttyS0.
>
> Greetings,
>
> Eike

Yes, I understand these issues. I went through the process of doing a
gentoo install a couple of years ago. And I did so without an
additional serial port. It just took ages to figure out getting all
the bits built. I fired up my c8000 again yesterday, but noticed one
of the disks is flakey so I can't log in now.

A PDC_CONSOLE enabled kernel requires no additional serial port, it
works fine over the serial port. But the debian/gentoo install kernels
disable it for some reason. All you need to do is boot without a
keyboard attached, with your serial port set at 9600/n8, you'll get
the PDC stuff come up and be able to 'boot lan'.

But if, like me, you don't have another fast hppa box to build stuff
on, you'll need to:
 - build a cross hppa-linux toolchain
 - build palo bits with native toolchain and the 32bit hppa-linux toolchain
 - build a cross hppa64-linux toolchain
 - cross build a 64 bit kernel with hppa64-linux toolchain
 - smash your kernel and palo together in a lan boot compatible way
 - set up a dhcpd/tftpd/nfsd that all gel together for lan booting
your parisc box.

Needless to say, this can be time consuming and error prone. Which is
why I'm asking...

Does anyone have a PDC_CONSOLE enabled install iso? Or lan bootable image?

-Graham
