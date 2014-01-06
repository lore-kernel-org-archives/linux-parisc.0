From: Dave Land <xmechanic@landcomp.net>
Subject: Re: [PATCH] parisc: Ensure full cache coherency for kmap/kunmap
Date: Sun, 05 Jan 2014 23:25:47 -0700
Message-ID: <52CA4C6B.5040605@landcomp.net>
References: <BLU0-SMTP52D17D9034339F8843CB9D97B70@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP52D17D9034339F8843CB9D97B70@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/5/14 7:25 PM, John David Anglin wrote:
> Helge Deller noted a few weeks ago problems with the AIO support on
> parisc.  This change is the
> result of numerous iterations on how best to deal with this problem.
>
> The solution adopted here is to provide full cache coherency in a
> uniform manner on all parisc systems.
> This involves calling flush_dcache_page() on kmap operations and
> flush_kernel_dcache_page() on
> kunmap operations.  As a result, the copy_user_page() and
> clear_user_page() functions can be removed
> and the overall code is simpler.
>
> The change ensures that both userspace and kernel aliases to a mapped
> page are invalidated and flushed.
> This is necessary for the correct operation of PA8800 and PA8900 based
> systems which do not support
> inequivalent aliases.
>
> With this change, I have observed no cache related issues on c8000 and
> rp3440.  It is now possible for example
> to do kernel builds with "-j64" on four way systems.
>
> On systems using XFS file systems, the patch recently posted by Mikulas
> Patocka to "fix crash using XFS
> on loopback" is needed to avoid a hang caused by an uninitialized lock
> passed to flush_dcache_page()
> in the page struct.
>
> Signed-off-by: John David Anglin  <dave.anglin@bell.net>
> ---
>
>
> --
> John David Anglin    dave.anglin@bell.net
>
>

Just an FYI for all... I still get the inequivalent aliases messages 
periodically on both my PA8700 machines, and the only tasks they're 
doing at the moment is buildd work, and a LAMP-based website on the 
'hpviz' (J6750), though I haven't seen any of those messages pointing 
toward issues with PHP, Apache2, or MySQL... at least not yet. Hopefully 
this patch will help eliminate the problem on the PA8700 series and 
others. ;-)

Dave L.

-- 
Dave Land
Land Computer Service  xmechanic@landcomp.net
ICQ: 676030523


