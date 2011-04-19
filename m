From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Tue, 19 Apr 2011 13:10:57 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1104191254300.19358@router.home>
References: <20110415135144.GE8828@tiehlicka.suse.cz>  <alpine.LSU.2.00.1104171952040.22679@sister.anvils>  <20110418100131.GD8925@tiehlicka.suse.cz>  <20110418135637.5baac204.akpm@linux-foundation.org>  <20110419111004.GE21689@tiehlicka.suse.cz>
 <1303228009.3171.18.camel@mulgrave.site>  <BANLkTimYrD_Sby_u-fPSwn-RJJyEVavU5w@mail.gmail.com>  <1303233088.3171.26.camel@mulgrave.site>  <alpine.DEB.2.00.1104191213120.17888@router.home> <1303235306.3171.33.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Pekka Enberg <penberg@kernel.org>, Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303235306.3171.33.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 19 Apr 2011, James Bottomley wrote:

> > Right !NUMA systems only have node 0.
>
> That's rubbish.  Discontigmem uses the nodes field to identify the
> discontiguous region.  page_to_nid() returns this value.  Your code
> wrongly assumes this is zero for non NUMA.

Sorry the kernel has no node awareness if you do not set CONFIG_NUMA

F.e. zone node lookups work the following way

static inline int
zone_to_nid(struct zone *zone)
{
#ifdef CONFIG_NUMA
        return zone->node;
#else
        return 0;
#endif
}

How in the world did you get a zone setup in node 1 with a !NUMA config?


The problem seems to be that the kernel seems to allow a
definition of a page_to_nid() function that returns non zero in the !NUMA
case. And slub relies on page_to_nid returning zero in the !NUMA case.
Because NODES_WIDTH should be 0 in the !NUMA case and therefore
page_to_nid must return 0.

> I can fix the panic by hard coding get_nodes() to return the zero node
> for the non-numa case ... however, presumably it's more than just this
> that's broken in slub?

If you think that is broken then we have brokenness all over the kernel
whenever we determine the node from a page and use that to do a lookup.

