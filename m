From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: shmctl() broken on 64bit kernel
Date: Fri, 15 Oct 2010 17:12:27 -0400
Message-ID: <20101015211227.GK8332@bombadil.infradead.org>
References: <4CB8C1E5.2090609@steuerkanzlei-deller.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CB8C1E5.2090609@steuerkanzlei-deller.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 15, 2010 at 11:04:37PM +0200, Helge Deller wrote:
>  32bit shmctl() syscall is broken on the 64bit parisc kernel.
> 

Have you had a chance to look at the patch you posted a few weeks ago
about the SHM_INFO breakage? I suspect it fixes this as well?

I think plucking the sparc64 or ppc64 structs should be ok, I don't
think there's any alignment differences offhand.

--Kyle
