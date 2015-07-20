From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached
 to the pgd
Date: Mon, 20 Jul 2015 22:28:56 +0300 (EEST)
Message-ID: <alpine.LRH.2.11.1507202228030.21509@math.ut.ee>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr> <55A408F5.601@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	jejb@parisc-linux.org, mpatocka@redhat.com,
	kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55A408F5.601@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Hi Christophe,
> 
> On 13.07.2015 11:32, Christophe JAILLET wrote:
> > Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
> > introduced a memory leak.
> >
> > After this commit, the 'return' statement in pmd_free is executed in all
> > cases. Even for pmd that are not attached to the pgd.
> > So 'free_pages' can never be called anymore, leading to a memory leak.
> 
> That's really great!!! Thanks for spotting this!
> 
> I assume this fixes the leak which killed our debian buildds with OOM
> after an uptime of 1-4 days and which only happened since kernel 4.0.
> Meelis Roos reported the issue already in this thread:
> http://marc.info/?l=linux-parisc&m=142999113232154&w=2

Yes, the patch that is merged in 4.2-rc3 fixed my RP3410 with 1G RAM.

-- 
Meelis Roos (mroos@linux.ee)
