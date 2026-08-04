Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBF36654C
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846888; cv=none; b=trDZ2/4dZx59Z5KRi2A1TRBbJ1lGTImnQqAWVzy8oKk/htxJ3k00AogscVcT2JV8GWZ1FHG2cJT7/b/FCDpQL2vE+blqUIb3yh6L7PIZN2KWhA1I0k2TiFvGGl7NG9/LB5UrBQqc+C1mf87FPEVAorYUwsJ7gCOVB0PBeOcA7e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846888; c=relaxed/simple;
	bh=PNOBsOEO0G+6w8uPgwMaYbgBIRpAHF/l3D7kSmf0KtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlBwqbAYLZIq7UyoTX5Rf1tU0sNHxkuM7OmyFA+Qqi9/a2jrSPw6OdwOizcFeKtTU2XmhzrTRWRkH4tTRQfHbYtBgKUs4UXuOCPCoc4W2Tp6XOQN/Si4gK0XSxXtTkOBMooukXGjqRvchUzULsXxNSGKPmUgTJmBYo6Q6k2npZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E7923FA1;
	Tue,  4 Aug 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB46A779C4;
	Tue,  4 Aug 2026 12:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tKeyJmLccWoTUgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 04 Aug 2026 12:34:42 +0000
Date: Tue, 4 Aug 2026 13:34:41 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2 2/6] parisc: Drop own implementations for ptep_get()
 and ptep_test_and_clear_young()
Message-ID: <anHcJZYyz9Zrshdm@pedro-suse>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-3-pfalcato@suse.de>
 <anHHyiHqYf3yLf2K@lucifer>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHHyiHqYf3yLf2K@lucifer>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 8E7923FA1
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, Aug 04, 2026 at 12:11:08PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Aug 03, 2026 at 05:43:56PM +0100, Pedro Falcato wrote:
> > From: Helge Deller <deller@gmx.de>
> >
> > Switch to the generic implementations, which are identical.
> 
> You sure do like succinct commit messages :)

I didn't even write this one! See the From: :))

> 
> Maybe worth saying by dropping the __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG and
> ptep_get defines you get the generic versions from include/pgtable.h which are
> functionally identical.
> 

I can touch it up though, if you insist.

> (Being pedantic, they're not quite strictly identical as the
> ptep_test_and_clear_young() generic function does some weird unnecessary
> indirection with a local variable and the single {} is dropped etc.)
> 
> >
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Suggested-by: John David Anglin <dave.anglin@bell.net>
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> 
> Nits above notwithstanding, LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

-- 
Pedro
