Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d072.dhcp212-198-140.noos.fr [212.198.140.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29E594829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 04:51:51 -0600 (MDT)
Date: Tue, 3 Sep 2002 12:51:43 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: "Jorge GOMEZ CABELLO" <jorge.gomez@sanmina-sci.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20020903125143.5dd1e297.varenet@esiee.fr>
In-Reply-To: <000601c25325$f3bcb080$ad3c179f@tol.ses.alcatel.es>
References: <000601c25325$f3bcb080$ad3c179f@tol.ses.alcatel.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: PALO-text
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

On Tue, 3 Sep 2002 10:43:18 +0200
"Jorge GOMEZ CABELLO" <jorge.gomez@sanmina-sci.com> wrote:

> Dear Puffin,
> 
>     We are trying to install Debian 3.0 on our HP B2000/785 and it is impossible to recognize the usb keyboard. is there a special commando to introduced in the command line of the palo 1.0 ?

- This reply has been CC'd to the parisc-linux mailing list -

Hi Jorge,

If I remember correctly, the USB support is not enabled by default in the install kernel for Debian 3.0, and B2000 does use a USB keyboard.
We had such a problem here, and there is a solution: boot and install the box using the following lifimage:
http://pateam.esiee.fr/cd-images/lifimages/lifimage-2.4.18-pa46-USBSTI64-20020704.gz
This one has support for USB in both 32/64bit kernels, and what's more, STI console is supported in 64bit kernel. This will allow you to install the box directly with a 64bit kernel.

We may build a more recent lifimage with such USB/STI support soon.

Maybe we can also consider adding at least USB support to the default kernel configuration ? Richard, any comment ? :)

Greetings,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
