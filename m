From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 21:39:46 +0100
Message-ID: <20040715203946.GN32326@parcelfarce.linux.theplanet.co.uk>
References: <200407152025.i6FKP1ng011630@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407152025.i6FKP1ng011630@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 15, 2004 at 04:25:01PM -0400, John David Anglin wrote:
> Precompiled headers (PCH) seem to be broken at the moment on hppa-linux
> on at least certain kernel versions (2.6.6-pa4) because of the following
> assumption in the PCH implementation:
> 
>    This version assumes that the kernel honors the START operand of mmap
>    even without MAP_FIXED if START through START+SIZE are not currently
>    mapped with something.  */
> 
> int
> mmap_gt_pch_use_address (void *base, size_t size, int fd, size_t offset)
> {
> 
> Anybody have any ideas as to whether parisc-linux can support the
> above?  It seems to break down for large PCH files.  START isn't
> honored under hpux either.

That's an unwarranted assumption.  If they want that, they need to
specify MAP_FIXED.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
