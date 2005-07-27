From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: nptl build failures (so close!)
Date: Wed, 27 Jul 2005 12:51:44 -0400
Message-ID: <20050727165144.GO9703@systemhalted.org>
References: <20050726194540.GG9703@systemhalted.org>
	<200507262110.j6QLA9kx011081@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507262110.j6QLA9kx011081@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 26, 2005 at 05:10:09PM -0400, John David Anglin wrote:
> > I tried to debug a weird header file include problem in the nptl headers
> > last night, but to no avail. It looks like gcc was reordering the includes
> > and "lll_lock_t" wasn't included. This time around "ERANGE" is missing, but 
> > if I trace the headers by hand it should have been included.
> 
> Have you looked at the -E output?  Also, add -dM to see macro defines.

Ah thanks, I always forget about the -dM to see those cursed macros that
are probably my issue.

The TLS headers are tricky to say the least and more confusing due to
the defines that enable and disable various "Standards."

I'm sure GCC has it's fair share of these problems.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
