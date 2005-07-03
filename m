From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ATI 3D Rage II+ Video Card
Date: Sun, 03 Jul 2005 09:56:22 +0000
Message-ID: <42C7B646.1000602__15257.5323627845$1416623830$gmane$org@tiscali.be>
References: <5.1.1.6.1.20050703114537.02a58010@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "J. L. Lee" <jllee@singnet.com.sg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5.1.1.6.1.20050703114537.02a58010@pop.singnet.com.sg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Lee,


J. L. Lee wrote:
> Hi,
> 
> If you are interested, followiong are some test results I carried out 
> while trying to bring up an ATI 3D Rage II+ video card on my B2000 which 
> runs on Linux kernel 2.6.12-rc6-pa1.
> 
> The video card outputs from 'lspci -v' are:
> 
> 0000:01:01.0 VGA compatible controller: ATI Technologies Inc 3D Rage II+ 
> 215GTB [Mach64 GTB] (rev 9a) (prog-if 00 [VGA])
>     Flags: bus master, stepping, medium devsel, latency 255
>     Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
>     I/O ports at 12000 [size=256]
>     Memory at f4800000 (32-bit, non-prefetchable) [size=4K]
>     Expansion ROM at f4820000 [disabled] [size=128K]
> 
Iirc for such ATI 3D Rage on a non-i386 platform you would have to select:

  CONFIG_FB_ATY_XL_INIT: (sic "to support booting a Rage XL without BIOS support.")

i.e. something like in your make menuconfig:

<M>   ATI Mach64 display support
[*]     Mach64 CT/VT/GT/LT (incl. 3D RAGE) support
[ ]       Mach64 generic LCD support (EXPERIMENTAL) (NEW)
[*]       Rage XL No-BIOS Init support

Hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
