From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
Date: Thu, 27 Feb 2003 11:59:17 -0500 (EST)
Message-ID: <200302271659.h1RGxHtF021557__18363.0713531331$1416622247$gmane$org@hiauly1.hia.nrc.ca>
References: <3E5BA291000009D9@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: schwab@suse.de, willy@debian.org, parisc-linux@parisc-linux.org,
	gcc@gcc.gnu.org
To: jsoe0708@tiscali.be (Joel Soete)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E5BA291000009D9@ocpmta3.freegates.net> from "Joel Soete" at Feb 27, 2003 07:36:56 am
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Never the less, I would like to put an additional question:
> the mentionned error occurs when this variable is a global one
> but when it became local (e.g. when I define it into main() ) the error doesn't
> occur anynore (I do not presume of the resulting code).
> So what is the conceptual difference?

If you look at the assembly code, you will see that the initialization
is done entirely in code when RW_LOCK_UNLOCKED is used to initialize
a local.  You can handle more complex initializers when you use code
to initialize an object.  When global or static storage is initialized,
the initialized values are placed directly into a data section.  C++
has constructors to do more complex initializations but this isn't
present in standard C.

The reason as to why GCC can't handle your example when it could before
has to do with the alignment of GCC to ISO C.  Constraint "3" in the
standard states that "If the compound literal occurs outside the body
of a function, the initializer list shall consist of constant expressions."
Also, as Andreas said, "the value of a compound literal is that of an
unnamed object initialized by the initializer list".  You would get
the same error trying to do an initialization using a named object:

  struct a { int i; } a = { 1 };
  struct b { struct a x; } b = { a };

I think you want to avoid using compound literals for you particular
initialization.  You don't need the capability of compound literals
to initialize an object type or an array of unknown size, or that
each compound literal creates only a single object in a given scope
(this is useful if the initializer values aren't constant).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
