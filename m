From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Wed, 22 Dec 2010 21:19:41 -0500
Message-ID: <20101223021941.GA3924@hiauly1.hia.nrc.ca>
References: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, eike-kernel@sf-tec.de
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 12 Dec 2010, Guy Martin wrote:

> Recently, swap got broken. When it has to be used, the kernel issue the
> following line numerous times :
> swap_free: Bad swap offset entry 00100009

The incorrect handling of conditional branches followed by an (empty) asm
is now fixed in the gcc tree on all active branches (4.3 through to head).

The 4.2 branch is closed.  So, I wouldn't recommend using it or any earlier
branch of gcc for kernel builds.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
