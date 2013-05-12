From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [PATCH] parisc: make default cross compiler search more robust
 (v4)
Date: Sun, 12 May 2013 20:33:41 +0200
Message-ID: <20130512203341.22d34f99@marga.jer-c2.orkz.net>
References: <20130511190409.GA5110@p100.box>
	<20130511215555.GA12893@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Mike Frysinger <vapier@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130511215555.GA12893@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 11 May 2013 23:55:55 +0200
Helge Deller <deller@gmx.de> wrote:

> People/distros vary how they prefix the toolchain name for 64bit
> builds. Rather than enforce one convention over another, add a for
> loop which does a search for all the general prefixes.
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
> 	hppa2.0-unknown-linux-gnu
> 	hppa2.0-linux-gnu
> 	hppa2.0-linux
> 	hppa1.1-unknown-linux-gnu
> 	hppa1.1-linux-gnu
> 	hppa1.1-linux
> 
> This patch was initiated by Mike Frysinger, with feedback from Jeroen
> Roovers, John David Anglin and Helge Deller.
> 
> CC: Mike Frysinger <vapier@gentoo.org>
> CC: Jeroen Roovers <jer@gentoo.org>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>

Signed-off-by: Jeroen Roovers <jer@gentoo.org>


     jer
