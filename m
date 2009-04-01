From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH next] parisc: asm/pdc.h should include asm/page.h
Date: Wed, 1 Apr 2009 19:30:01 -0400
Message-ID: <20090401233001.GF1443@bombadil.infradead.org>
References: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com> <20090401150115.GA1443@bombadil.infradead.org> <a4423d670904010806j7de7b311yb3137e8b73ad12f2@mail.gmail.com> <20090401150956.GB1443@bombadil.infradead.org> <a4423d670904010843r76c3a4faxd2841387772be89@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670904010843r76c3a4faxd2841387772be89@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 01, 2009 at 07:43:40PM +0400, Alexander Beregalov wrote:
> From: Alexander Beregalov <a.beregalov@gmail.com>
> Subject: [PATCH] parisc: asm/pdc.h should include asm/page.h
> 
> Fixes this build error:
> arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Thanks, applied.
