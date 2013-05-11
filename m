From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: make default cross compiler search more robust (v3)
Date: Sat, 11 May 2013 15:13:11 -0400
Message-ID: <BLU0-SMTP63A418EF74AC599429393797A60@phx.gbl>
References: <20130511190409.GA5110@p100.box>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Jeroen Roovers <jer@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130511190409.GA5110@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11-May-13, at 3:04 PM, Helge Deller wrote:

> People/distros vary how they prefix the toolchain name for 64bit  
> builds.
> Rather than enforce one convention over another, add a for loop which
> does a search for all the general prefixes.
>
> For 64bit builds, we now search for (in order):
> 	hppa64-unknown-linux-gnu
> 	hppa64-linux-gnu
> 	hppa64-linux
>
> For 32bit builds, we look for:
> 	hppa-unknown-linux-gnu
> 	hppa-linux-gnu
> 	hppa-linux
> 	hppa1.1-unknown-linux-gnu
> 	hppa1.1-linux-gnu
> 	hppa1.1-linux
> 	hppa2.0-unknown-linux-gnu
> 	hppa2.0-linux-gnu
> 	hppa2.0-linux


As I tried to say before, I would search for hppa2.0 before hppa1.1 in  
case both are installed.

Dave
--
John David Anglin	dave.anglin@bell.net



