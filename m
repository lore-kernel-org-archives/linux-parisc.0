From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [PATCH] parisc: make default cross compiler search more robust
Date: Thu, 9 May 2013 14:28:23 +0200
Message-ID: <20130509142823.444ac244@marga.jer-c2.orkz.net>
References: <1368076115-22262-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Mike Frysinger <vapier@gentoo.org>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1368076115-22262-1-git-send-email-vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu,  9 May 2013 01:08:35 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> People/distros vary how they prefix the toolchain name for 64bit
> builds. Rather than enforce one convention over another, add a for
> loop which does a search for all the general prefixes.  This code
> will run for both native and cross builds when CROSS_COMPILE isn't
> explicitly set.

Several architectures appear to use a scriptlet called 
cc-cross-prefix for this. See scripts/Kbuild.include.


     jer
