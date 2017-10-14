From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] parisc: parport_gsc: constify parisc_device_id
Date: Sat, 14 Oct 2017 22:27:37 +0100
Message-ID: <20171014212737.GA4712@sudip-laptop>
References: <208280b55a359db78eecee720799955f2043fb49.1503162439.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, deller@gmx.de, linux-kernel@vger.kernel.org,
        linux-parisc@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <208280b55a359db78eecee720799955f2043fb49.1503162439.git.arvind.yadav.cs@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Aug 19, 2017 at 10:38:41PM +0530, Arvind Yadav wrote:
> parisc_device_id are not supposed to change at runtime. All functions
> working with parisc_device_id provided by <asm/parisc-device.h> work
> with
> const parisc_device_id. So mark the non-const structs as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/parport/parport_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This has already been done by f0973443bef7 ("parisc/parport_gsc: Fix section mismatches")

--
Regards
Sudip
