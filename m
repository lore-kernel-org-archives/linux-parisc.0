From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 18:00:48 -0400
Message-ID: <119aab440907311500v14b192e7t8a244d9d3b2c482e@mail.gmail.com>
References: <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com>
	 <20090731212634.737DB4CFD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: deller@gmx.de, elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org, submit@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731212634.737DB4CFD@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 5:26 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> I don't have more details... =A0The idea is as Carlos outlined. =A0Th=
ere's
> code in the binutils elf32-hppa.c and elf64-hppa.c files to implement
> the above for dynamic libraries. =A0That's what made me think of it.

Binutils is not involved in the kernel module loader, instead
arch/parisc/kernel/module.c (get_fdesc) chooses where the gp will
point to.

If you set gp to the middle of the GOT table, *and* implement
long/short ldd access on 64-bit, then you would get a total of 8191
possible slots per module.

Personally I think the lower risk, quicker fix, is to implement a fix
for 64-bit kernels that uses ldd in format 3 for all offsets > 15
bytes, and thus allow you to set MAX_GOTS to 4095.

Note: ldd format 3 can't be used to load immediate values between 15
and -16 bytes.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
