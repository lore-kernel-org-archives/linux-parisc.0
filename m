Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp01.web.de [217.72.192.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B08C4834
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 May 2003 06:23:51 -0600 (MDT)
Received: from [145.254.236.155] (helo=dialin-145-254-236-155.arcor-ip.net)
	by smtp.web.de with asmtp (WEB.DE 4.98 #218)
	id 19CIWz-0002vv-00
	for parisc-linux@lists.parisc-linux.org; Sun, 04 May 2003 14:23:49 +0200
From: Berthold Gunreben <b.gunreben@web.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] {kinda OT] A4947A applicability? and FC driver work
Date: Sun, 4 May 2003 14:25:05 +0200
References: <1052020498.27841.7.camel@daily> <20030504041715.GH31610@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030504041715.GH31610@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <200305041008.49439.b.gunreben@web.de>
Content-Type: text/plain;
  charset="iso-8859-1"
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

Am Sonntag, 4. Mai 2003 06:17 schrieb Matthew Wilcox:
> On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:
> > I found one of these kits on eBay - C200 to C240 upgrade, CPU on
> > mainboard. Do any of the HP techs around here know if it'll also fit a
> > C180? It'd be nice to drop a large performance upgrade into it for not
> > much cash...
>
> Well... it'll _fit_.  Whether firmware will work properly is anyone's
> guess. There's various differences between the C180 and C200 that
> make this combination not sure to succeed.  My personal opinion (and
> not speaking on behalf of my emplyer) is that it's going to work 90%.

I don=B4t think you will be very happy with it. One of the bigger problems =
will=20
be your power supply. The C240 has a much stronger power supply (at least t=
he=20
one that I have) than the C180.=20

> Maybe the onboard scsi controller won't be initialised properly.
> Maybe the missing bit of init won't make any difference to Linux or
> maybe it'll start corrupting data.  It's a bit of a gamble.
