From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Tue, 12 Oct 2004 16:38:50 -0400
Message-ID: <20041012203849.GI24430@baldric.uwo.ca>
References: <41617557000010DC@mail-6-bnl.tiscali.it>
	<20041008170106.GW24430@baldric.uwo.ca>
	<20041011044409.GW14151@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041011044409.GW14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> is there a fix for this? i was building glibc from cvs today to look at
> the _dl_debug_state problem and ran into this too.... (also the problem
> with the missing NULL defn for waitid)

I have a fix for the missing NULL defn.

> The problem here seems to be that we are using the generic dl-sysdep.h 
> and errno.c/errno-loc.c definitions, and when building rtld-errno-loc.o,
> __errno_location is coded to return &errno and not &rtld_errno.

Yeah, I saw this yesterday while going through the tree.
 
> i hacked this in my build but not sure if this is the proper solution --
> should we propose a change to the generic errno-loc.c? or do we need our
> own? or am i on the wrong track?

IMO your hack is correct, a lot of other arches just 
write their own version of this file and change it 
depending on the defines.

I get a warning when I compile this and it doesn't 
fail the build for me.


The patch looks good.

As for the missing _dl_debug_state, I'm really starting
to think it's a linker issue.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
