From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATCH v2 0/4] dma-mapping: Define dma_{alloc,free}_attrs() for
 all archs
Date: Wed, 22 May 2013 11:37:17 +0900
Message-ID: <519C2F5D.8000809@igel.co.jp>
References: <1367290899-10410-1-git-send-email-dhobsong@igel.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	catalin.marinas@arm.com, will.deacon@arm.com,
	linux-arm-kernel@lists.infradead.org, msalter@redhat.com,
	linux-c6x-dev@linux-c6x.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367290899-10410-1-git-send-email-dhobsong@igel.co.jp>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,
On 2013/04/30 12:01, Damian Hobson-Garcia wrote:
> Most architectures that define CONFIG_HAVE_DMA=y, have implementations for
> both dma_alloc_attrs() and dma_free_attrs().  All achitectures that do
> not define CONFIG_HAVE_DMA also have both of these definitions provided by
> dma-mapping-broken.h.
> 
> Provide a default definition for the archs that define CONFIG_HAVE_DMA=y,
> but have no implementation for dma_{alloc,free}_attrs(). 
> 
> As I don't have hardware for any of these systems, the patches are only
> compile-tested where I could (arm64, s390) and untested for the archs
> where I couldn't find a readily available prebuilt cross-compiler (c6x, parisc).
> 


>  arch/arm64/include/asm/dma-mapping.h  |   17 +++++++++++------
>  arch/c6x/include/asm/dma-mapping.h    |    3 +++
>  arch/parisc/include/asm/dma-mapping.h |    3 +++
>  arch/s390/include/asm/dma-mapping.h   |   17 +++++++++++------
>  4 files changed, 28 insertions(+), 12 deletions(-)
> 

Since this series spans several architectures, what would be the best
way to have this patch series merged?
Should I resubmit each patch to the mailing list for each architecture
separately?

Thank you,
Damian

-- 
Damian Hobson-Garcia
IGEL Co.,Ltd
http://www.igel.co.jp
