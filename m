From: Jeff Liu <jeff.liu@oracle.com>
Subject: Re: [PATCH 12/24] drivers/parisc: return actual error on pdc_stable_init
Date: Wed, 18 Jun 2014 09:46:12 +0800
Message-ID: <53A0EF64.2090400@oracle.com>
References: <53A05121.1040100@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
To: JBottomley@parallels.com, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53A05121.1040100@oracle.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On 06/17/2014 22:30 PM, Jeff Liu wrote:
> From: Jie Liu <jeff.liu@oracle.com>
> 
> Return the actual error code than ENOMEM if call kset_create_and_add()
> failed at pdc_stable_init().
> 
> Cc: James E.J. Bottomley <jejb@parisc-linux.org>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Jie Liu <jeff.liu@oracle.com>
>

Please ignore this patch because Greg think that is incorrect.

Cheers,
-Jeff
