Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0C6C74856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 15:03:53 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
Date: Tue, 9 Mar 2004 22:59:05 +0100
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<28565.193.161.152.244.1078828435.squirrel@www.puszczka.com>
In-Reply-To: <28565.193.161.152.244.1078828435.squirrel@www.puszczka.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403092259.05202.deller@gmx.de>
Cc: Andy Walker <andy@puszczka.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Dienstag, 9. März 2004 11:33, Andy Walker wrote:
> I'm just about to give this a try. The reason these weren't enabled is
> that menuconfig was a bit non-intuitive (to me at least). Maybe I was
> just being paranoid, but when I selected ATKBD or MOUSE_PS2 then the GSC
> PS/2 item got closed up and I didn't know whether it was on or off. That
> scared me and I assumed that selecting GSC PS/2 support would enable
> everything else I needed. Compiling now, but I won't be able to test
> until I get home from work and actually get my hands on the keyboard/mouse.

Hi Andy,

I agree, that this behaviour seems somehow little strange. Thibaut Varene
complained too.
But on the other side without this auto-enablement of the GSC PS/2 controller
users maybe enable PS/2 mouse and/or PS/2 keyboard and miss enabling the
GSC PS/2 controller too - with the result, that neither keyboard or mouse would
work when the kernel is booted....

Personally I prefer the automatic enablement. Even on iA32 this is the default now.

Best regards,
Helge
