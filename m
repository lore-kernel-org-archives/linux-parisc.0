From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: my usual problem with 64bit kernel
Date: Tue, 15 Dec 2009 21:25:47 +0100
Message-ID: <20091215202547.GA18193@raptus.dandreoli.com>
References: <20091204172838.GA4551@raptus.dandreoli.com>
 <4B1959E2.1030700@gmx.de>
 <20091205083511.GA6559@raptus.dandreoli.com>
 <20091207234404.GA5083@raptus.dandreoli.com>
 <20091209235038.GA12806@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091209235038.GA12806@raptus.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 10, 2009 at 12:50:38AM +0100, Domenico Andreoli wrote:
> On Tue, Dec 08, 2009 at 12:44:04AM +0100, Domenico Andreoli wrote:
> > On Sat, Dec 05, 2009 at 09:35:11AM +0100, Domenico Andreoli wrote:
> > > On Fri, Dec 04, 2009 at 07:50:10PM +0100, Helge Deller wrote:
> > > 
> > > > I just want to make sure, that you have more or less a correct kernel
> > > > configuration setup (.config)....
> > > 
> > > there is at least a configuration glitch which makes my kernel hang
> > > and the debian one continue in degraded mode. i attached also the
> > > configuration, just in case i forgot something important.
> > 
> > i found the configuration glitch, it is CONFIG_DEBUG_MUTEXES. if it is
> > set, 64bit hangs right after "Releasing cpu 1 now, hpa=...", otherwise
> > the 64bit boot continues with a "SMP: CPU:1 is stuck."
> 
> i was wrong, it's again CONFIG_DEBUG_SPINLOCK. if it is set, the
> boot hangs.

i bisected something, commit 44048d700bcbfaf4bcca6e2e0a73d89d01ec0878
breaks my SMP parisc64. before it, kernel boots with 2 CPUs
(as did 2.6.22). after it, it hangs at "Releasing cpu 1 now,
hpa=fffffffffffa2000" but CONFIG_DEBUG_SPINLOCK is _not_ set, the
opposite i reported in this thread at 64bit and consistently with
current 2.6.32 at 32bit.

i'm pretty confused by the whole thing but i'm sure about this bisection,
i double-checked it. here is the diff.

--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -749,23 +749,6 @@ int move_freepages_block(struct zone *zone, struct page *page, int migratetype)
        return move_freepages(zone, start_page, end_page, migratetype);
 }
 
-/* Return the page with the lowest PFN in the list */
-static struct page *min_page(struct list_head *list)
-{
-       unsigned long min_pfn = -1UL;
-       struct page *min_page = NULL, *page;;
-
-       list_for_each_entry(page, list, lru) {
-               unsigned long pfn = page_to_pfn(page);
-               if (pfn < min_pfn) {
-                       min_pfn = pfn;
-                       min_page = page;
-               }
-       }
-
-       return min_page;
-}
