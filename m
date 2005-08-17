From: Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Wed, 17 Aug 2005 15:50:26 +0200 (METDST)
Message-ID: <Pine.HPX.4.33n.0508171547320.19860-100000__13266.321065794$1416623903$gmane$org@studcom.urz.uni-halle.de>
References: <20050817015119.GA18244@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050817015119.GA18244@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle McMartin wrote:
> Your patch appears to work fine in OSS mode, but native ALSA on
> PA-RISC still seems broken.

The biggest difference may be that OSS uses power-of-two period and
buffer sizes.

Does it work with "aplay --period-size=1024 --buffer-size=8192 ..."?


Regards,
Clemens

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
