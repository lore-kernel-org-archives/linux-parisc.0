From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Bringing into life HP B2000
Date: Mon, 8 Feb 2010 09:10:48 -0700
Message-ID: <20100208161048.GA7893@lackof.org>
References: <E7AA31FE5C0105418A19147DAF5EA92A0CB05BCAA5@server.igig.up.wroc.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Witold Rohm <witold.rohm@igig.up.wroc.pl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <E7AA31FE5C0105418A19147DAF5EA92A0CB05BCAA5@server.igig.up.wroc.pl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 08, 2010 at 03:03:21PM +0100, Witold Rohm wrote:
> Dear Grant, 
> I'm presently trying to run debian 5.0 on B2000 Visualize FX
> Hp station - everything goes fine until the X server is starting
> - according to hp pa risc forum - it's not possible to get X window
> running on the FX card, and it's true. 
> So i was trying to mount  PCI card I' ve tried the S3, Matrox II,
> cards and none of them works - even if I change the path console
> to PCI3. I checked the service Chasis codes and it states that:
> "error executing ENTRY INIT" 
> Could you give me any advice or help?

Hi Witold,
Please CC linux-parisc mailing list for help. Folks there know more than I do.

What I do know is normal PCI cards do NOT have the firmware support (aka IODC)
to function as console for PA-RISC. What does work is using a serial console
to setup the machine so X11 can talk to a Matrox card. I'm not sure which
one but I'm pretty sure someone had this working before.

BTW, you've read the parisc graphics-howto?
   http://www.parisc-linux.org/faq/graphics-howto.html

hth,
grant

> Best regards
> Witold Rohm 
