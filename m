Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id E50F24856
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 15:14:02 -0700 (MST)
Message-ID: <2998.192.168.1.54.1078870913.squirrel@www.puszczka.com>
In-Reply-To: <200403092259.05202.deller@gmx.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<28565.193.161.152.244.1078828435.squirrel@www.puszczka.com>
	<200403092259.05202.deller@gmx.de>
Date: Tue, 9 Mar 2004 23:21:53 +0100 (CET)
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
From: "Andy Walker" <ajwalker@broadpark.no>
To: "Helge Deller" <deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Dienstag, 9. März 2004 11:33, Andy Walker wrote:
> Hi Andy,
>
> I agree, that this behaviour seems somehow little strange. Thibaut Varene
> complained too.
> But on the other side without this auto-enablement of the GSC PS/2
> controller
> users maybe enable PS/2 mouse and/or PS/2 keyboard and miss enabling the
> GSC PS/2 controller too - with the result, that neither keyboard or mouse
> would
> work when the kernel is booted....
>
> Personally I prefer the automatic enablement. Even on iA32 this is the
> default now.
>
> Best regards,
> Helge
>

Helge,

Glad to report that the keyboard is now working. No mouse yet, but I
need to try it without the KVM in the way as that's likely to be the
problem. Perhaps I need .proto=bare or .proto=imps2.
At the moment I get:

serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
input: AT Raw Set 2 keyboard on parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
gscps2.c: timeout - could not write byte 0xed
gscps2.c: sending byte 0xed failed.

cat /dev/misc/psaux and wobbling the mouse gives nothing.

cheers,
-Andy
