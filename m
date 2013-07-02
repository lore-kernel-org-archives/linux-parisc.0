From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: switch to gzip-compressed vmlinuz kernel
Date: Wed, 03 Jul 2013 00:24:49 +0200
Message-ID: <51D35331.30206@gmx.de>
References: <20130629113124.GA1320@p100.box> <BLU0-SMTP510D290B15E6925904E11C97770@phx.gbl> <51CF3B81.8010807@gmx.de> <BLU0-SMTP67AC6F18E8093CF6C8C2E797770@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP67AC6F18E8093CF6C8C2E797770@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/29/2013 10:00 PM, John David Anglin wrote:
>>> I have built a palo-1.19 package which should be uploaded to the archive soon.
>>> Made up something for changelog.

FYI, I've just uploaded a new palo-1.90 package with changelog and such to our repository at parisc-linux.org.
My palo source repository is http://git.kernel.org/cgit/linux/kernel/git/deller/palo.git
The master branch now holds all my changes - do not use the dev_gzip branch any longer.

I'm planning for a palo-2.0 package as soon as I have time to finish the other wishlist items (e.g. xz-support, loading ISO/tftboot images, ...).
 
Helge
