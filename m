Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18A204829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Nov 2002 08:40:10 -0700 (MST)
Date: Thu, 7 Nov 2002 16:39:33 +0100
Message-ID: <3DA3DE6600004657@ocpmta4.be.tiscali.com>
In-Reply-To: <20021107135222.GD4465@systemhalted>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] [Trap 26 -> EXT3?][If you feel bored, test these 2.5 changes...]
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Carlos,

>
>Joel,
>
>Wow, you added those changes and EXT3 stopped functioning? :}
>Please revert the patch and try to build/boot a kernel again.
>
>Code 26 -> "Data Memory Access Rights" trap, looks like a 
>misbehaving EXT3.
>
I test your patch on my 2.4.20-rc1(-pa24) and the kernel boot and run well
:)).

I try to trigger the usage of this traps
double a=1., b=0., c;
c=a/b;
printf ("Ratio a/b: %f);

but it do not cause any fp interrupt error? (well that is an another question)

Back to 2.5.46-pa1, I revert the patch and rebuild the kernel and the kernel
won't boot more. So it seems that problem comes from ext3 usage.
How may I come back to ext2 (tune2fs -O ^has_journal /dev/md0 [my boot partition]
) I nerver do it and a bit affraid to loose my system :(

Joel


-------------------------------------------------------------
Tiscali Complete, l'accès Internet moins cher que gratuit ! Plus d'info:
http://complete.tiscali.be
