From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 5 Mar 2005 14:46:53 -0500
Message-ID: <20050305194652.GG23803@baldric.uwo.ca>
References: <20050303024545.GR23803@baldric.uwo.ca>
	<200503030321.j233LoiR013194@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503030321.j233LoiR013194@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 02, 2005 at 10:21:49PM -0500, John David Anglin wrote:
> > There are a lot of files that do symbol resolution. I think I might just
> > save the fp argument registers, and thus allow gcc to do any sorts of
> > optimizations it wishes with therest of the code, knowing that the
> > arguments are all saved and restored on the initial function call.
> 
> Sounds good.
> 
> I think we have somehow broken __cffc.  I did a binutils build
> yesterday and various ld tests are now failing.  These are tests
> that compare function pointers.

I didn't feed anything new into debian-glibc. All my patches have always
strived to keep __cffc working, if I messup the function pointer
comparison I get a slew of glibc testsuite failures which I always
patchup by making sure __cffc works :)

The last botch was a minor change in the trampoline template, which
prompted the addition of the 'bl' before the function that made use of
the magic '-4' check in __cffc.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
