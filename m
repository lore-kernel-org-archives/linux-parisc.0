From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 18:04:59 -0400
Message-ID: <20040921220458.GH13248@baldric.uwo.ca>
References: <20040921174353.GB13248@baldric.uwo.ca>
	<200409211851.i8LIpT1Z009455@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409211851.i8LIpT1Z009455@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Sep 21, 2004 at 02:51:29PM -0400, John David Anglin wrote:
> > On Tue, Sep 21, 2004 at 10:22:45AM -0700, Randolph Chung wrote:
> > > but 10100158 is lstrncpy_from_user, not $lsfu_exit:
> > > 10100158 <lstrncpy_from_user>
> > > 10100190 <$lsfu_exit>
> > > 
> > > i wonder if the sections are somehow confusing things.... this is with
> > > fairly recent gcc/binutils toolchains, for 32-bit.
> > 
> > Multiple entry points to a function may not work if an import stub is
> > required? The import stubs are thrown into a hash, and it probably
> > thinks it's okay for you to use the same import stub. You on the other
> > want a second entry point.
> > 
> > I recommend you give the exit it's own symbol, .export and .import the
> > linker thinks it's two different functions?
> 
> Good catch!  I've hit this problem before but under HP-UX.  GAS doesn't
> support the alternate entry point fixup needed to support multiple
> entry points to a function.  I don't think anyone has tried to support
> this with the ELF tools.  There could be some nasty interactions with
> the HP unwind data when you start adding multiple entry points to a
> function.

I think you said we had similar problems with non-local goto's?

Either we had a conversation about multiple entry points, or I read it
in one of the HP documents :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
