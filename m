From: Helge Deller <deller@gmx.de>
Subject: Re: New Debian Kernel Packages
Date: Fri, 02 Aug 2013 00:20:41 +0200
Message-ID: <51FADF39.4020505@gmx.de>
References: <BLU0-SMTP89A9F5D677CA80946A5DB097550@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP89A9F5D677CA80946A5DB097550@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dave,

On 07/30/2013 12:46 AM, John David Anglin wrote:
> The following kernel packages are now in the parisc-linux.org
> archive:
> 
> linux-image-3.10-1-parisc-smp_3.10.3-1_hppa.deb 
> linux-image-3.10-1-parisc64-smp_3.10.3-1_hppa.deb 
> linux-image-3.10-1-parisc64_3.10.3-1_hppa.deb 
> linux-image-3.10-1-parisc_3.10.3-1_hppa.deb

That's fantastic!
This brings us one big step further to being able to build a real debian-unstable-installer boot CD.

I'm still hoping the C8000 patches I pushed for inclusion into 3.11 will then
show up in stable 3.10 series soon as well. If that happens we will have a kernel
which should boot on all machines - including the c8000.

Helge
