From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Sun, 13 Feb 2011 14:39:35 -0500
Message-ID: <20110213193934.GA28834@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: James.Bottomley@HansenPartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110212161846.GA24076@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 12 Feb 2011, John David Anglin wrote:

> On Thu, 10 Feb 2011, John David Anglin wrote:
> 
> > > The usual case would be just one address to flush.  Would it be too
> > > much overhead to do a prescan to determine if there are inequivalent
> > > aliases before doing any flushes?  I think I'll try this.
> > 
> > Testing the following.  Dropped debug message.
> 
> Although I didn't see any slow timer messages, I still had a number of
> GCC testsuite timeouts.  I didn't see these timeouts with interrupts
> disabled.  So, I plan to see if read write locks can be used without
> disabling interrupts.

Read write locks won't work.  "spin_lock_irq(&mapping->tree_lock)" is
used extensively in the mm code.

To get a better idea of the maps when we have INEQUIVALENT ALIASES, I
changed the code to print the complete set.  old_addr is the first address
in the list.

Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41a7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in
 file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7e000 in
 file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in
 file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in
 file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40e7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027e000 in file libc-2.11.2.so with flags 0x8100077
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41a7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x41e7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40e7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x40a7d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4127d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4067d000 in file libc-2.11.2.so with flags 0x8100075
Feb 13 07:00:24 mx3210 kernel: INEQUIVALENT ALIASES 0x40a7e000 and 0x4027d000 in file libc-2.11.2.so with flags 0x8100075

As can be seen, the list is quite long and contains numerous duplicate entries.
I think all the entries with VM_WRITE set in flags are equivalent.  Same for
the entries where VM_WRITE is not set.  I'm not sure what can be assumed
about the list order, but the two sets are grouped in this case.  So, the
technique used in James' change seems reasonably good for this case.

It might be two passes over the list should be used to first flush shared
writeable maps, and then another pass to invalidate the other maps.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
