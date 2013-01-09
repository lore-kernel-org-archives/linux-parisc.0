From: Rik van Riel <riel@redhat.com>
Subject: Re: [PATCH 8/8] mm: remove free_area_cache
Date: Wed, 09 Jan 2013 16:25:21 -0500
Message-ID: <50EDE041.1050908@redhat.com>
References: <1357694895-520-1-git-send-email-walken@google.com> <1357694895-520-9-git-send-email-walken@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>,
        Tony Luck <tony.luck@intel.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org
To: Michel Lespinasse <walken@google.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1357694895-520-9-git-send-email-walken@google.com>
List-ID: <linux-mm.kvack.org>

On 01/08/2013 08:28 PM, Michel Lespinasse wrote:
> Since all architectures have been converted to use vm_unmapped_area(),
> there is no remaining use for the free_area_cache.
>
> Signed-off-by: Michel Lespinasse <walken@google.com>

Yay

Acked-by: Rik van Riel <riel@redhat.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
