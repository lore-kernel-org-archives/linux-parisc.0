From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 13:43:54 -0400
Message-ID: <20040921174353.GB13248@baldric.uwo.ca>
References: <20040921172245.GS22642@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040921172245.GS22642@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Sep 21, 2004 at 10:22:45AM -0700, Randolph Chung wrote:
> but 10100158 is lstrncpy_from_user, not $lsfu_exit:
> 10100158 <lstrncpy_from_user>
> 10100190 <$lsfu_exit>
> 
> i wonder if the sections are somehow confusing things.... this is with
> fairly recent gcc/binutils toolchains, for 32-bit.

Multiple entry points to a function may not work if an import stub is
required? The import stubs are thrown into a hash, and it probably
thinks it's okay for you to use the same import stub. You on the other
want a second entry point.

I recommend you give the exit it's own symbol, .export and .import the
linker thinks it's two different functions?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
