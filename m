From: Helge Deller <deller@gmx.de>
Subject: STI text console for ATI FireGL cards?
Date: Thu, 31 Oct 2013 22:26:00 +0100
Message-ID: <5272CAE8.6050108@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

Maybe some people here on the list know the answer to this question?

Does the ATI FireGL cards (in e.g. a C8000) have a STI ROM?

I'm asking, because I noticed that with a 64bit kernel the
sticon driver (the Linux 8-color text console driver for STI) does 
crash while it worked nicely with a 32bit kernel.
I was able to fix this bug (patch is coming soon), but while
I was working on the driver, I found that it doesn't support
the ATI FireGL X1/X3 cards (e.g. in my C8000) either.
Now, as long as the Linux aty framebuffer drivers don't work reliable,
sticon would be at least a nice option for the text console.

Nevertheless, on the C8000 I do see the boot screen, e.g. for IPL.
So I'm wondering if with the ATI cards in general STI is used
for the boot screen or not.  

I did looked in the ATI cards PCI ROM for a secondary/third ROM,
but the things I found didn't looked like a STI-ROM either.

Any help/ideas would be appreciated.

Helge
