From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] Remove irq_region_ops
Date: Thu, 30 Dec 2004 19:48:16 +0000
Message-ID: <41D45B80.2040807@tiscali.be>
References: <20041230184520.GA18080@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041230184520.GA18080@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Matthew Wilcox wrote:
[...]
> 
> Tested on a 725, mostly with Lasi-based devices.  It'd be nice if someone
> tested this on an IOSAPIC-based machine (eg a500/b2000/n4000/j7000/c8000)

build and boot fine on n4k (64bit 2way system) (on going to rebuild kernel ;-)
same results on b2k 64bit kernel (32bit on going to build)

> I'd like to commit this soon and move onto step 2.
> 
Just would like to test on b180 (on going to build too) and c110 ;-)

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
