From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: 2.6.15-rc5-mm2 can't boot on ia64 due to
	changing on_each_cpu().
Date: Thu, 15 Dec 2005 08:41:00 -0700
Message-ID: <20051215154100.GB9286__16688.7075444267$1416624576$gmane$org@parisc-linux.org>
References: <20051215030040.GA28660@kvack.org>
	<43A0FE0D.6030100@jp.fujitsu.com>
	<20051215152450.2445.Y-GOTO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 tony.luck@intel.com,
 linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Benjamin LaHaise <bcrl@kvack.org>,
 Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
 parisc-linux@parisc-linux.org
To: Yasunori Goto <y-goto@jp.fujitsu.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051215152450.2445.Y-GOTO@jp.fujitsu.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 15, 2005 at 03:34:27PM +0900, Yasunori Goto wrote:
> Thanks! It works!
> 
> BTW, I found same casted function at on_each_cpu() in parisc code.
>  (arch/parisc/kernel/cache.c
>   arch/parisc/kernel/smp.c
>   arch/parisc/mm/init.c)
> 
> Are they also should fixed? 
> I don't have parisc box. So, I don't know there is same trouble on
> parisc box or not, and I can't test it.

Yes, these  will also need to be changed.  Thanks.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
