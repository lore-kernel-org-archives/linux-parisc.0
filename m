From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 15 Feb 2011 10:58:10 -0600
Message-ID: <1297789090.3015.31.camel@mulgrave.site>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca>
	 <20110210200044.203164E01@hiauly1.hia.nrc.ca>
	 <20110212161846.GA24076@hiauly1.hia.nrc.ca>
	 <20110213193934.GA28834@hiauly1.hia.nrc.ca>
	 <20110215015852.GA6615@hiauly1.hia.nrc.ca>
	 <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
	 <20110215164703.GA9471@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110215164703.GA9471@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2011-02-15 at 11:47 -0500, John David Anglin wrote:
> On Tue, 15 Feb 2011, Carlos O'Donell wrote:
> 
> > On Mon, Feb 14, 2011 at 8:58 PM, John David Anglin
> > <dave@hiauly1.hia.nrc.ca> wrote:
> > > Feb 14 07:48:06 mx3210 kernel: INEQUIVALENT ALIASES: page 0x4282e520 addr 0x411e
> > > 8000 in file libc-2.11.2.so with flags 0x8000071
> > >
> > > i haven't tracked down where these come from but this looks like a glibc issue.
> > > Note the final vm_flags value for the final map.  This is the inequivalent one.
> > > As far as I know, the GCC testsuite does not play with MAP_FIXED maps.
> > >
> > > Carlos, any thoughts on where this might come from?
> > 
> > Could you more clearly describe exactly what is the problem from
> > glibc's perspective?
> 
> It's a little hard to tell since I haven't found the application
> the causes the above inequivalent aliases.

There was a prink in the inequivalent alias detector that printed
task->comm (that's the process name) if you add it back it will give
more information.

> >From a kernel perspective, we need to avoid multiple maps of the same
> memory page with inequivalent virtual addresses (i.e., the maps must
> start at the same address & 0x3fffff).

If I understand what you've done: you already patched the kernel to
force MAP_FIXED onto this boundary.  If that's the case, the actual
problem must be an offset mapping; meaning something maps a region and
then maps a subregion of it.  I've got to guess this is the dynamic
loader.

> Inequivalent maps only result from the use of MAP_FIXED.  All
> the maps with VM_READ and VM_EXEC are equivalent in this case,
> so it's fairly clear that the map is for a code segment of
> libc-2.11.2.so.  There is one map with just the VM_READ flag
> that is not equivalent.  Because there are multiple maps to the
> same memory page, the page is in effect shared.
> 
> Ideally, glibc should use equivalent aliases for all maps that
> it creates when they are "shared" as above.
> 
> > The dynamic loader will do a non-fixed mapping to cover the entire
> > range of the PIC code needed to load into memory. This ensures it has
> > enough space to map segments. Then it follows up by using MAP_FIXED to
> > exactly map the segment from the file into memory. It also maps
> > remaining pages at MAP_FIXED from fd=-1 (zero fill).
> 
> I tend to think this is the problem area.  I will try to find a
> testcase.

Great, thanks!  Just getting an application (or .c file) that does this
will give us a better opportunity to analyse what the problem is.

James


