From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] Re: "If futex's were mutex's we'd have a fish fry!"
	or "Why we need LWS on hppa"
Date: Wed, 11 Aug 2004 14:42:09 -0700
Message-ID: <20040811214208.GN546@tausq.org>
References: <20040811195731.GK29662@baldric.uwo.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040811195731.GK29662@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I continue to work on the light-weight-syscalls infrastructure, and it
> seems to be going well. I have to continually rethink what is "correct"
> and what is "practical" in terms of an implementation.

what do you guys think about this?

<tausq> well, can you just make the trap handler notice that you are coming
          from the gatway page, return a specific error code, and then fall
          back to do a regular syscall?
* tausq is thinking that will be cleaner
<tausq> rather than special casing things in many places...
<patofiero> tausq : Yeah, I think the slow path is just going to be really
            slow, and I'll have to teach the intr_save asm to notice that I'm
            a gateway lws and setup appropriately.
<patofiero> more asm!
<patofiero> tausq : The corner casese are getting really ugly.
<tausq> but the thing is, if you are only doing cas once in a while, you don't
          really care that it's a bit slow. if you are doing it a lot (like in
          a loop) it probably will only fault the first time or so
<patofiero> Exactly.
<patofiero> The page will stay hot.
<tausq> so, don't do a lot of special things in intr_save to setup stacks and
<tausq> (this is how futexes work, right?)
<patofiero> they do the reverse, they look for contention from userspace and
            then go into a syscall.
<tausq> similar idea.... look for contention/error in a lws, and then go into
          a syscall
<patofiero> I'll have to think about it.

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
