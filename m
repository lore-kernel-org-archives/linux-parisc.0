From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] C3600 crash with PCMCIA bridge
Date: Sat, 07 Oct 2006 10:27:41 -0500
Message-ID: <1160234861.3459.27.camel@mulgrave.il.steeleye.com>
References: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-10-07 at 16:55 +0200, Guy Martin wrote:
> I've been experiencing kernel crashes when I plug a RICOH RL5c475 cardbus bridge.
> 
> I've attached the crash info.
> 
> Linux hope 2.6.17.4-pa6 #1 Thu Jul 13 09:06:34 CEST 2006 parisc PA8600 (PCX-W+) GNU/Linux

The only parisc chip known to work with cardbus is dino ... there are a
few strage tweaks you have to do to get it all running (and even dino
only seems to work with my single socket yenta bridge; it doesn't work
for helge with his dual yenta tadpole).

No-one's ever looked at putting the necessary code into astro ...
although it shouldn't be that hard.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
