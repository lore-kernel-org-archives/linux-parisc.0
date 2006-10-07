From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] C3600 crash with PCMCIA bridge
Date: Sat, 7 Oct 2006 18:15:30 +0200
Message-ID: <200610071815.31131.deller@gmx.de>
References: <20061007165519.d85d8839.gmsoft@tuxicoman.be>
	<1160234861.3459.27.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Guy Martin <gmsoft@tuxicoman.be>,
 parisc-linux@parisc-linux.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1160234861.3459.27.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 07 October 2006 17:27, James Bottomley wrote:
> On Sat, 2006-10-07 at 16:55 +0200, Guy Martin wrote:
> > I've been experiencing kernel crashes when I plug a RICOH RL5c475 cardbus bridge.
> > 
> > I've attached the crash info.
> > 
> > Linux hope 2.6.17.4-pa6 #1 Thu Jul 13 09:06:34 CEST 2006 parisc PA8600 (PCX-W+) GNU/Linux
> 
> The only parisc chip known to work with cardbus is dino ... there are a
> few strage tweaks you have to do to get it all running (and even dino
> only seems to work with my single socket yenta bridge; it doesn't work
> for helge with his dual yenta tadpole).

Hi James,

One correction:
Last time I tried (and after a few people here on the list helped) it did worked with both slots in my tadpole.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
