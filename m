From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [RFC/PATCH 0/4] dma-mapping: Define dma_{alloc,
 free}_attrs() for all archs
Date: Mon, 22 Apr 2013 14:07:40 +0900
Message-ID: <1366607260-2852-1-git-send-email-dhobsong@igel.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-parisc@vger.kernel.org, catalin.marinas@arm.com, deller@gmx.de,
 will.deacon@arm.com, msalter@redhat.com,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 linux-arm-kernel@lists.infradead.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org

Most architectures that define CONFIG_HAVE_DMA=y, have implementations for
both dma_alloc_attrs() and dma_free_attrs().  All achitectures that do
not define CONFIG_HAVE_DMA also have both of these definitions provided by
dma-mapping-broken.h.

Provide a default definition for the archs that define CONFIG_HAVE_DMA=y,
but have no implementation for dma_{alloc,free}_attrs() by simply calling
dma_{alloc,free}_coherent() and throwing away the attrs argument.

Damian Hobson-Garcia (4):
  Provide default implementation for dma_{alloc,free}_attrs on arm64
  Provide default implementation for dma_{alloc,free}_attrs on c6x
  Provide default implementation for dma_{alloc,free}_attrs on parisc
  Provide default implementation for dma_{alloc,free}_attrs on s390

 arch/arm64/include/asm/dma-mapping.h  |    3 +++
 arch/c6x/include/asm/dma-mapping.h    |    3 +++
 arch/parisc/include/asm/dma-mapping.h |    3 +++
 arch/s390/include/asm/dma-mapping.h   |    3 +++
 4 files changed, 12 insertions(+), 0 deletions(-)

-- 
1.7.5.4
