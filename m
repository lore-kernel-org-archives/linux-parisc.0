From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Sat, 5 Dec 2009 03:39:18 +0300
Message-ID: <20091205003918.GD16465@x200>
References: <20091127065112.GC26327@x200.malnet.ru>
 <20091128061354.GA21113@lackof.org>
 <20091128092509.GA4375@x200.malnet.ru>
 <20091129051752.GA14332@lackof.org>
 <20091201140746.8d0e740e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091201140746.8d0e740e.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 01, 2009 at 02:07:46PM -0800, Andrew Morton wrote:
> On Sat, 28 Nov 2009 22:17:52 -0700
> Grant Grundler <grundler@parisc-linux.org> wrote:
> 
> > > Yes, it's slightly less racy than create_proc_entry().
> > > create_proc_entry() is going to be removed in fact.
> > 
> > Ok. Please add a sentence about which race you are worried about.
> > This isn't to discuss the race - it's just informative to explain
> > why there is a plan to replace the API. I'm willing to go along with
> > that.
> > 
> > Are you removing create_proc_entry() ? Is this patch part of a grand plan?
> > (All good things to include in a commit comment)
> > 
> > Also updating Documentation/filesystems/seq_file.txt would be very
> > helpful given you understand why proc_create_data() should replace
> > create_proc_entry().
> 
> yeah.  I didn't even know that this was the reason and I've been
> applying the patches like crazy.  Heaven knows what a random developer
> of a remote subsystem is supposed to make of such a patch.  Probably he
> just assumes that someone else knows what's going on.
> 
> Alexey, please, don't do this.
> 
> 
> Please send me some boilerplate text which I can paste into

Here it is:

Convert code away from ->read_proc/->write_proc interfaces.
Switch to proc_create()/proc_create_data() which make addition of
proc entries reliable wrt NULL ->proc_fops, NULL ->data and so on.

Problem with ->read_proc et al is described here
commit 786d7e1612f0b0adb6046f19b906609e4fe8b1ba
"Fix rmmod/read/write races in /proc entries"
