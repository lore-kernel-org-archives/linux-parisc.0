From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 17:43:15 -0400
Message-ID: <20090706214315.GA3826@bombadil.infradead.org>
References: <119aab440907060936x7051933fgfde585df640ca1b1@mail.gmail.com> <20090706184539.5A76D4FE0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>, randolph@tausq.org,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706184539.5A76D4FE0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 06, 2009 at 02:45:37PM -0400, John David Anglin wrote:
> I have to think that this has something to do with the machine
> being a rp3440 (large memory and cache).  I have never seen this
> on my c3750 with 32-bit UP kernel.  Also, this was with a 64-bit
> UP kernel.
> 

If I remember correctly, there's still some issues with the L2 cache on
pa8800 that we haven't quite bothered to work out yet, since it's "good
enough" for now. James probably knows more. It would be interesting to
see if you could reproduce it with a UP 64-bit kernel on your C3750 to
discount the L2 problems.

regards, Kyle

