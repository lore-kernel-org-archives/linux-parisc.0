From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Tue, 16 Aug 2005 21:51:19 -0400
Message-ID: <20050817015119.GA18244__74.7849270284817$1416623901$gmane$org@roadwarrior.mcmartin.ca>
References: <20050812021423.GB14400@roadwarrior.mcmartin.ca>
	<Pine.HPX.4.33n.0508120911590.10052-200000@studcom.urz.uni-halle.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Clemens Ladisch <clemens@ladisch.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.HPX.4.33n.0508120911590.10052-200000@studcom.urz.uni-halle.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 12, 2005 at 09:17:47AM +0200, Clemens Ladisch wrote:
> It should apply against both, but it seems somewhere some whitespaces
> got lost ...
> 
> Here you go again.

Sorry for taking so long to get back to you. Your patch appears to work
fine in OSS mode, but native ALSA on PA-RISC still seems broken. Thibaut
seems to point out that this is not the driver, but a more deep seated
problem, as the driver seems to function properly in native ALSA playback
mode on powerpc.

I'll keep the patch in my tree, and give it a few days of beating.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
