From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Fwd: problem installing Debian on HP R class 9000
Date: Mon, 26 Feb 2007 09:50:18 -0700
Message-ID: <20070226165018.GB30763__36078.7470629022$1416624318$gmane$org@colo.lackof.org>
References: <b74751490702220323o3b3d78a9u14b024a75341c986@mail.gmail.com>
	<b74751490702260642i4b1a2538rd384e280e0a24622@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: ram <talk2ram@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <b74751490702260642i4b1a2538rd384e280e0a24622@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 26, 2007 at 08:12:55PM +0530, ram wrote:
> Kernel Panic- not syncing:drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O
> MMU is out of mapping resources

Yeah, this is a known problem. Current workaround is to hack the
ccio driver to increase the minimum amount of IOVA space allocated.

We need to make this a kernel parameter.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
