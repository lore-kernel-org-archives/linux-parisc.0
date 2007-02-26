From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Sun, 25 Feb 2007 21:53:03 -0600
Message-ID: <1172461983.3423.34.camel__34648.8387244337$1416624317$gmane$org@mulgrave.il.steeleye.com>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
	<1172277920.3424.83.camel@mulgrave.il.steeleye.com>
	<119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-25 at 21:19 -0500, Carlos O'Donell wrote:
> current->comm, and cr8 included in the dump.

Thanks!

> sr00-03  0000000000077000 0000000000000000 0000000000000000 0000000000077000
> sr04-07  0000000000077000 0000000000077000 0000000000077000 0000000000077000
> 
> IASQ: 0000000000077000 0000000000077000 IAOQ: 0000000040723f2c 0000000040723f2f
>  IIR: 43ffff40    ISR: 0000000000000000  IOR: 0000000000000000
>  CPU:        0   CR30: 000000009af10000 CR31: 0000000040848000
>  ORIG_R28: 0000000042c774c8
>  CR8: 00000000000001e0

Perfect, 0x1e8 on a 64 bit kernel (where SPACEID_SHIFT is 11) is
0x78000.  This means that the protection and the space are indeed
mismatched ... we just have to find out how, sigh!

>  current->comm: 000000009af253e8

Actually, current->comm should be printed as a %s: it's the name of the
faulting process.

>  IAOQ[0]: cuda_images+0xc14/0x3180
>  IAOQ[1]: cuda_images+0xc14/0x3180
>  RP(r2): 0x40bf0e1c

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
