From: Andy Walker <andy@puszczka.com>
Subject: Re: [parisc-linux] Booting Sarge (24-Mar) on c110
Date: Sun, 10 Apr 2005 20:59:43 +0200 (CEST)
Message-ID: <2363.192.168.1.67.1113159583.squirrel@www.puszczka.com>
References: <42594374.2040803@earthlink.net>
	<20050410165816.GF8669@parcelfarce.linux.theplanet.co.uk>
	<4259652B.4090007@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: "Bryan W. Headley" <bwheadley@earthlink.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <4259652B.4090007@earthlink.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Matthew Wilcox wrote:
>
>>On Sun, Apr 10, 2005 at 10:17:08AM -0500, Bryan W. Headley wrote:
>>
>>
>>>Everything works fine, up til the dreaded STI -switchover. So, it boots,
>>>but video isn't initialized right. Let's see: I'm using tty0, with
>>>monitor type 3 (1280x1024 Vesa), using graphics3.
>>>
>>>Of course, it worked fine with kernel 2.4.x.
>>>
>>>
>>
>>What graphics card are you using?
>>
>>
>>
> Watching 2.4.20 boot, it says,
>
> 16. U2-IOA BC GSC+ Port (7) at 0xf3fbf000 [8/63], versions 0x501, 0x1,
> 0xc,  add
> itional addresses: 0xf3f80000
> 17. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0x7,
> 0xb
> 18. Coral SGC Graphics (10) at 0xf4000000 [10/16], versions 0x4, 0x0, 0x77
> 19. U2-IOA BC GSC+ Port (7) at 0xf3fff000 [10/63], versions 0x501, 0x1,
> 0xc
>
> And later says, STI device: HPA4071B_LZ
>
> I don't know if this is useful, but the fact that there is nothing in
> graphics0 .. graphics2 an issue?

No, the graphics0 vs. graphics2 thing shouldn't make any difference at all.
What kernel is Sarge using - Helge Deller submitted some fixes for Hyperbowl
in 2.6 a while back, but I'd have thought they'd have made it into Debian
by now.

I sent Helge a Hyperbowl to help him debug (not one with the Z board, just
a plain 4071B), but it sounded like he was too busy with other stuff to
hack on it right now.

Does the Hyperbowl support double buffering (can't remember off hand) and
if so, is it enabled? If its enabled, turn it off - it won't work.

-Andy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
