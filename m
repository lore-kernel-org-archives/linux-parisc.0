From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 14:51:29 -0400 (EDT)
Message-ID: <200409211851.i8LIpT1Z009455@hiauly1.hia.nrc.ca>
References: <20040921174353.GB13248@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040921174353.GB13248@baldric.uwo.ca> from "Carlos O'Donell" at
	Sep 21, 2004 01:43:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, Sep 21, 2004 at 10:22:45AM -0700, Randolph Chung wrote:
> > but 10100158 is lstrncpy_from_user, not $lsfu_exit:
> > 10100158 <lstrncpy_from_user>
> > 10100190 <$lsfu_exit>
> > 
> > i wonder if the sections are somehow confusing things.... this is with
> > fairly recent gcc/binutils toolchains, for 32-bit.
> 
> Multiple entry points to a function may not work if an import stub is
> required? The import stubs are thrown into a hash, and it probably
> thinks it's okay for you to use the same import stub. You on the other
> want a second entry point.
> 
> I recommend you give the exit it's own symbol, .export and .import the
> linker thinks it's two different functions?

Good catch!  I've hit this problem before but under HP-UX.  GAS doesn't
support the alternate entry point fixup needed to support multiple
entry points to a function.  I don't think anyone has tried to support
this with the ELF tools.  There could be some nasty interactions with
the HP unwind data when you start adding multiple entry points to a
function.

I haven't looked at this in detail but possibly you can change the
fixup table to contain pc-relative offsets.  I looked at this
when I reworked the casesi pattern in GCC a few months ago.  This
makes the table smaller and in many cases the number of instructions
is less than that with branches in the table (particularly for the
PIC case).  I ended up putting the table in the same section as the
text since in that case the offsets were absolute.  However, I did
look at putting the offsets in readonly data.  This is where I came
up with the method to create 32 and 64-bit pc-relative offsets.  It
takes a couple of extra instructions to load the address of a table
that's in a different section.  As a side, I believe that only 32-bit
offsets are needed in the 64-bit runtime.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
