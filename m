From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: build failure of stlport 5.0.2 on hppa
Date: Wed, 30 Aug 2006 20:10:01 -0400 (EDT)
Message-ID: <200608310010.k7V0A2MW016233@hiauly1.hia.nrc.ca>
References: <17653.15850.943986.966989@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: mail.twerner@googlemail.com,
 ptr@island.corbina.net,
 parisc-linux@parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17653.15850.943986.966989@gargle.gargle.HOWL> from "Matthias
	Klose" at Aug 30, 2006 09:27:38 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > compiling the library with USE_STATIC_LIBGCC=1 leads to other error messages:
> > > 
> > > obj/gcc/shared/test_main.o: In function `main':
> > > ../../../test/unit/cppunit/test_main.cpp:138: undefined reference to
> > > `_Unwind_Resume'

You need to look at how test_main.o is being linked (e.g., add -v, -Wl,-v,
or -Wl,-debug to the compilation/link command.  There's not enough info
to determine whether this is a GCC or package bug. 

> > 2. --disable-shared:
> >       libgcc.a    --- runtime gcc support, C++ exceptions support
> >       libsupc++.a --- C++ language support
> > 
> > But on some platform (I treat it as bug in gcc build) not all support
> > functions present in correct place. Looks like this is you case.

If not all support functions are present in this case, please file a
GCC PR.  It's highly unlikely this is PA specific.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
