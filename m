From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] Revert "parisc: HAVE_ARCH_TRACEHOOK"
Date: Mon, 22 Feb 2010 13:53:16 -0500
Message-ID: <20100222185316.GA21734@bombadil.infradead.org>
References: <20100222184857.AA88C64C@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@elte.hu>
To: Roland McGrath <roland@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100222184857.AA88C64C@magilla.sf.frob.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 22, 2010 at 10:48:57AM -0800, Roland McGrath wrote:
> HAVE_ARCH_TRACEHOOK requires defining the user_regset interfaces,
> including task_user_regset_view().  parisc doesn't do that yet,
> so don't lie about it.
> 

Acked-by: Kyle McMartin <kyle@mcmartin.ca>
