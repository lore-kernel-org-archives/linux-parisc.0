Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A19A486E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Oct 2003 14:26:52 -0600 (MDT)
Message-ID: <3F91A1FE.2000901@tiscali.be>
Date: Sat, 18 Oct 2003 20:26:38 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: hinzen@blah.pl, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ATI rage xl and C360 (it works!)
References: <3F8A29A2000025F8@ocpmta1.freegates.net> <Pine.LNX.4.58.0310161708130.15082@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0310161708130.15082@sal.ucc.ie>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Max,

M. Grabert wrote:
> On Thu, 16 Oct 2003, Joel Soete wrote:
> 
> 
>>Thomas,
>>
>>Thanks a lot, you config file was very helpfull to make it work:
>>root@fw02:~# modprobe atyfb
>>atyfb: using auxiliary register aperture
>>atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
>>230 MHz PLL, 83 Mhz MCLK, 63 Mhz XCLKConsole: switching to colour frame buffer
>>device 80x30
>>fb0: ATY Mach64 frame buffer device on PCI
> 
> 
> I wonder whether you can also use more recent ATI Radeon graphic cards.

Hmm, on my b180 even if for s/w all seems ok (gdm run and no error 
neither in in XFree86.0.log nor in gdm/:0.log), nothing appears on the 
screen?
Having no other platform to test the card (which I suspect to be 
broken), I just still have an opportunity to test it on my b2k (near 
about c3k iirc) before any conclusion.

Anyway, unfortunaltely, the only other ATI card i could have at my 
disposal is an AGP model (useless for b180 or b2k models). Sorry to not 
being able to help you more.


> So far I've only seen reports about ATI Rage XL, but does this patch
> work with any kind of ATI card?
> 
I think (as far as can understand the patch content) that it is specific 
to this card model.

Well come Max,
	Joel
