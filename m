Return-Path: <herbert@13thfloor.at>
Received: from mail.13thfloor.at (MAIL.13thfloor.at [212.16.62.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 936E8484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 08:01:30 -0700 (MST)
Date: Thu, 18 Dec 2003 16:01:29 +0100
From: Herbert Poetzl <herbert@13thfloor.at>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Message-ID: <20031218150129.GA792@MAIL.13thfloor.at>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031218072506.GA8142@lst.de>
Cc: vserver@list.linux-vserver.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 08:25:06AM +0100, Christoph Hellwig wrote:
> On Wed, Dec 17, 2003 at 11:16:18PM +0100, Herbert Poetzl wrote:
> > 
> > Hi everyone!
> > 
> > I would like to 'officially' reserve a syscall number
> > for parisc(64)/vserver ... 
> 
> The syscall is the typical multiplexer crap, so an actual submission
> wouldn't have any chance.  Please fix up your junk beofe trying to
> play the reserve a syscall scheme.  This didn't work for afs or
> LSM either.

hohoho!

you are a funny guy, and I'm sure you will
explain your statement in all detail ...

just for your information:

vserver folks really do not care whether or not the
syscall is reserved on their architecture, as long 
as it's there, and it will be there anyway, I just 
wanted to be polite and correct, so if you 'think'
we split up the switch just for parisc(64) again, 
then I can assure you, that just won't happen ...

best,
Herbert

PS:

if you are actually interrested _how_ this is done
and _what_ we do to minimize issues, have a look at

 http://vserver.13thfloor.at/Stuff/vswitch.h
 http://vserver.13thfloor.at/Stuff/vswitch.c

some facts:

- the project started with 2 syscalls, and has grown
  to 7-8 syscalls (depending on the version)

- the syscall switch was not my idea, but I have to
  admit, that it simplified development drastically
  (no need to ask 10 people for a new syscall ;)

- we _are_ supporting several different architectures
  and we _are_ trying to avoid issues where possible,
  (for example we use the c99 types for structs)
  
- userspace handles this with a versioned interface


On Sun, Aug 31, 2003 at 10:57:42AM -0400, Rik van Riel wrote:
> How about a sys_vserver multiplexer so we can easily add
> things like setting a new ipv6 root to the interface,
> without needing yet another syscall ?

On Sat, Oct 04, 2003 at 03:31:11PM -0700, David S. Miller wrote:
>>> This interface stinks, system calls should have fixed known types not
>>> depending upon the value of some parameter, anything else is a
>>> disaster waiting to happen ala ioctl().

>> but I have to say, that I see no advantage in
>> using more syscalls, if they have to pass a user
>> space struct anyway ... (not all do)

> Then have a fixed enumeration for the command, and pass in
> as the type argument a union of the various possible structures.
> Then the types are clearly defined and it's much easier to write
> the compat translation layer.

On Sat, Oct 04, 2003 at 04:57:58PM -0700, David S. Miller wrote:
>>> We have like 7 or 8 system calls for posix timers,
>>> so I don't see why we can't have 3 or 4 for vserver
>>> so that we can have a well defined type get passed in
>>> for each specific system call.

>> that was my saying in the first place, please  
>> advise how to proceed on that?
>> (am I running in circles?)

> Ok, I already sent off an email to Linus so that I can have
> a discussion with him about this first.  I'll reply again once
> he replies to me and we discuss things.
