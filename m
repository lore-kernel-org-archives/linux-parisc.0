From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Wed, 2 Mar 2005 16:37:55 -0500
Message-ID: <20050302213755.GQ23803@baldric.uwo.ca>
References: <20050302192111.GN23803@baldric.uwo.ca>
	<200503021941.j22Jfi27010862@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503021941.j22Jfi27010862@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 02, 2005 at 02:41:44PM -0500, John David Anglin wrote:
> > 	/* Build a call frame, and save structure pointer. */
> > 	copy	%sp, %r26	/* Copy previous sp */
> > 	stwm	%r28,64(%sp)
> 
> r28?  I'm thinking that the static chain (r29) and struct value
> (r28) registers need to be saved as well as r23-r26.

To be truthful I'm only saving r28 because in the legacy code we saved
r28. I didn't know our toolchain used r28 for function entry or r29 for
function entry.

Are you suggesting this because we could use them in the future?

I know that r29 is the "static link register" for entry.
I don't understand the full purpose of r28 which is the "function result
address" on entry.

This is exactly the type of feedback I wanted! Thanks.

What do I do about the floating point registers?

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
