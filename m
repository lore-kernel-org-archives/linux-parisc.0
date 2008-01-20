From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Terrible PA8800 SMP Performance
Date: Sun, 20 Jan 2008 15:40:14 -0500 (EST)
Message-ID: <200801202040.m0KKeExq007167@hiauly1.hia.nrc.ca>
References: <20080120201042.GA1781@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080120201042.GA1781@phobos.i.cabal.ca> from "Kyle McMartin" at Jan 20, 2008 03:10:42 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> flushing 32MB of cache on every fork and exec? :/

That's what I was thinking, although the actual situation may be worse.
It appears we may flush the entire cache (32MB I-cache and 32MB D-cache)
on every cpu.

static void cacheflush_h_tmp_function(void *dummy)
{
        flush_cache_all_local();
}

void flush_cache_all(void)
{
        on_each_cpu(cacheflush_h_tmp_function, NULL, 1, 1);
}

void flush_cache_mm(struct mm_struct *mm)
{
#ifdef CONFIG_SMP
        flush_cache_all();
#else
	flush_cache_all_local();
#endif
}

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
