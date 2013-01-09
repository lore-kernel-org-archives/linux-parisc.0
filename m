From: Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH 0/8] vm_unmapped_area: finish the mission
Date: Tue, 8 Jan 2013 17:32:05 -0800
Message-ID: <CANN689EMBPqVCZdTZm1G0PznGpYR6Y5tMUOspE+emHaX=TkVtA@mail.gmail.com>
References: <1357694895-520-1-git-send-email-walken@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org
To: Rik van Riel <riel@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>, Matt Turner <mattst88@gmail.com>,
	David Howells <dhowells@redhat.com>, Tony Luck <tony.luck@intel.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1357694895-520-1-git-send-email-walken@google.com>
List-ID: <linux-mm.kvack.org>

Whoops, I was supposed to find a more appropriate subject line before
sending this :]

On Tue, Jan 8, 2013 at 5:28 PM, Michel Lespinasse <walken@google.com> wrote:
> These patches, which apply on top of v3.8-rc kernels, are to complete the
> VMA gap finding code I introduced (following Rik's initial proposal) in
> v3.8-rc1.

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
